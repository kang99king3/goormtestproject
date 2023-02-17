package example;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HkDao;
import dto.HkDto;

@WebServlet("/HkController.do")
public class HkController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//1단계:command값 받기(어떤 요청인지 확인하기 위해)
		String command=request.getParameter("command");
		System.out.println("요청내용:"+command);
		
		//2단계:dao객체 생성하기(DB에 연결해서 작업하기 위해 준비)
//	 	HkDao dao=new HkDao(); //매번 같은 객체를 만들면 메모리 효율 떨어지니깐
		HkDao dao=HkDao.getHkDao();// 싱글턴 패턴으로 구현해보자
		
		//3단계:command의 값을 확인하여 분기 실행(요청에 대한 처리)
		if(command.equals("main")){//index페이지로 이동
			response.sendRedirect("index.jsp");
		}else if(command.equals("boardlist")){//글목록을 요청했을 경우
			//5단계:실행결과 담기(dto,list 등등)
			List<HkDto> list=dao.getBoardList();//글목록 구하기
			
			//6단계:스코프에 객체 담기(key, value)
			request.setAttribute("list", list);
			//7단계:페이지 이동
//			pageContext.forward("boardlist.jsp");
			RequestDispatcher dispatch=request.getRequestDispatcher("boardlist.jsp");
			dispatch.forward(request, response);
			
			//스코프에 저장된 객체를 전달하지 못한다.
//	 		response.sendRedirect("boardlist.jsp");
		}else if(command.equals("insertform")){//글작성 폼이동
			response.sendRedirect("insertboard.jsp");
		}else if(command.equals("insertboard")){//작성된 글 추가하기
			String id=request.getParameter("id");
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			boolean isS=dao.insertBoard(new HkDto(id,title,content));
			
			if(isS){
//	 			pageContext.forward("HkController.do?command=boardlist");
//				RequestDispatcher disptch=request.getRequestDispatcher("HkController.do?command=boardlist");
//				disptch.forward(request, response);
				response.sendRedirect("HkController.do?command=boardlist");
			}else{
				request.setAttribute("msg", "글추가실패");
//				pageContext.forward("error.jsp");
				RequestDispatcher disptch=request.getRequestDispatcher("error.jsp");
				disptch.forward(request, response);
				
//				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}else if(command.equals("detailboard")){//상세보기
			String seq=request.getParameter("seq");
			int sseq=Integer.parseInt(seq);
			HkDto dto=dao.getBoard(sseq);
			
			request.setAttribute("dto", dto);
//			pageContext.forward("detailboard.jsp");
			RequestDispatcher disptch=request.getRequestDispatcher("detailboard.jsp");
			disptch.forward(request, response);
			
		}else if(command.equals("muldel")){
			String[] seqs=request.getParameterValues("chk");
		
			boolean isS=dao.mulDel(seqs);
			
			if(isS){
				String jsTag="<script type='text/javascript'>"
							+	"alert('글을 삭제합니다.');"
							+	"location.href='HkController.do?command=boardlist';"
							+"</script>";
				PrintWriter pw=response.getWriter();
				pw.print(jsTag);
			}else{
				request.setAttribute("msg", "글삭제 실패");
//				pageContext.forward("error.jsp");
				RequestDispatcher disptch=request.getRequestDispatcher("error.jsp");
				disptch.forward(request, response);
			}
		}else if(command.equals("updateform")){//수정폼 이동(수정할 내용 입력폼)
			String seq=request.getParameter("seq");
			
			HkDto dto=dao.getBoard(Integer.parseInt(seq));
			
			request.setAttribute("dto", dto);
//			pageContext.forward("updateboard.jsp");
			RequestDispatcher disptch=request.getRequestDispatcher("updateboard.jsp");
			disptch.forward(request, response);
		}else if(command.equals("updateboard")){//수정하기(DB반영)
			String seq=request.getParameter("seq");
			
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			int sseq=Integer.parseInt(seq);
			
			boolean isS=dao.updateBoard(new HkDto(sseq,title,content));
			
			if(isS){
				response.sendRedirect("HkController.do?command=detailboard&seq="+seq);
			}else{
				request.setAttribute("msg", "글수정실패");
//				pageContext.forward("error.jsp");
				RequestDispatcher disptch=request.getRequestDispatcher("error.jsp");
				disptch.forward(request, response);
			}
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}