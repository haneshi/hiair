package hiair_project1.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import hiair_project1.model.BoardItem;

public interface BoardMapper {
	
	@Select("SELECT id, subject, content, name, regDate, readCount FROM board ORDER BY id DESC")
	public List<BoardItem> selectAll();
	
	@Insert("INSERT INTO board (id, subject, content, name, regDate, readCount) " +
			"VALUES (BOARD_SEQ.NEXTVAL, #{subject}, #{content}, #{name}, SYSDATE, #{readCount})")
	public int insertWrite(BoardItem write);
	
	@Select("SELECT id, subject, content, name, regDate, readCount FROM board WHERE id=#{id}")
	public BoardItem selectById(@Param("id") int id);
	
	@Update("UPDATE board SET subject=#{subject}, content=#{content} WHERE id=#{id}")
	public void updateArticle(@Param("id") int id,
							  @Param("subject") String subject,
							  @Param("content") String content);
	
	@Delete("DELETE FROM board WHERE id=#{id}")
	public void deleteArticle(@Param("id") int id);
}
