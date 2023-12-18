package semi.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




import semi.dto.MarketBoardCommentDto;

@Repository
public class MarketBoardCommentDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace="semi.dao.MarketBoardCommentDao.";
	public void insertComment(MarketBoardCommentDto mcdto)
	{
		session.insert(nameSpace+"insertMarketBoardComment", mcdto);
	}
}