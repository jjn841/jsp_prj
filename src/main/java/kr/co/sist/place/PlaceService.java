package kr.co.sist.place;

import java.sql.SQLException;
import java.util.List;

import kr.co.sist.board.BoardDAO;
import kr.co.sist.board.BoardDTO;
import kr.co.sist.board.RangeDTO;

public class PlaceService {
	
	/**
	 * 맛집을 추가
	 * @param rDTO 식당명, 메뉴, 가격, 정보, 위도, 경도,op
	 * @return
	 */
	public boolean writeRestaurant( RestDTO rDTO) {
		boolean flag=false;
		
		PlaceDAO pDAO=PlaceDAO.getInstance();
		try {
			pDAO.insertRestaurant(rDTO);
			flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return flag;
	}//writeRestaurant
	
	/**
	 * 1.총 레코드의 수
	 * @param rDTO
	 * @return 레코드의 수
	 */
	public int totalCount( RangeDTO rDTO) {
		int cnt=0;
		PlaceDAO pDAO=PlaceDAO.getInstance();
		try {
			cnt=pDAO.selectTotalCount(rDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return cnt;
	}//totalCount

	/**
	 * 한 화면에 보여줄 게시물의 수
	 * @return 한 화면에 보여줄 게시물의 수
	 */
	public int pageScale() {
		int pageScale=10;
		
		return pageScale;
	}//pageScale

	/**
	 * 총 페이지 수 
	 * @param totalCount 총 게시물의 수
	 * @param pageScale 한 화면에 보여줄 게시글 수
	 * @return
	 */
	public int totalPage(int totalCount, int pageScale) {
		int totalPage=0;
		
		totalPage=(int)Math.ceil((double)totalCount/pageScale);
		
		return totalPage;
	}//totalPage

	/**
	 * pagenation을 클릭했을 때의 번호를 사용하여 해당 페이지의 시작번호를 구하기
	 * 예 1- 1, 2- 11, 3- 21, 4-31, 5-41
	 * @param pageScale 
	 * @param rDTO
	 * @return
	 */
	public int startNum(int pageScale, RangeDTO rDTO) {
		int startNum=1;
		
		startNum=rDTO.getCurrentPage()*pageScale-pageScale+1;
		rDTO.setStartNum(startNum);
		
		return startNum;
	}//startNum

	/**
	 * pagenation을 클릭했을 때의 번호를 사용하여 해당 페이지의 끝번호 구하기
	 * @param pageScale
	 * @param rDTO
	 * @return
	 */
	public int endNum( int pageScale, RangeDTO rDTO) {
		int endNum=0;
		
		endNum=rDTO.getStartNum()+pageScale-1;
		rDTO.setEndNum(endNum);
		
		return endNum;
	}//endNum

	/**
	 * 시작번호 끝 번호 사이의 게시물을 조회한다.
	 * @param rDTO
	 * @return
	 */
	public List<RestDTO> searchRestaurant(RangeDTO rDTO){
		List<RestDTO> list=null;
		
		PlaceDAO pDAO=PlaceDAO.getInstance();
		try {
			list=pDAO.selectRestaurant(rDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//searchBoard
	
	/**
	 * 선택된 게시글 하나 읽기
	 * @param num
	 * @return
	 */
	public RestDTO searchOneRestaurant( int num ) {
		RestDTO rDTO=null;
		
		PlaceDAO pDAO=PlaceDAO.getInstance();
		try {
			rDTO=pDAO.selectOneRestaurant(num);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return rDTO;
	}//searchOneBoard
	
	
}
