package hiair_project1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.time.LocalDateTime;
import java.util.List;
import hiair_project1.model.BoardItem;
import hiair_project1.repository.BoardMapper;

@Controller
@RequestMapping
public class BoardController {

    @Autowired
    private BoardMapper boardMapper;

    @GetMapping("/board")
    public String showBoardPage(Model model) {
        List<BoardItem> boardItems = boardMapper.selectAll();
        model.addAttribute("boardItems", boardItems);
        return "board";
    }

    @GetMapping("/write")
    public String showWriteForm() {
        return "write";
    }

    @PostMapping("/insertWrite")
    public String insertWrite(@RequestParam("name") String name,
                              @RequestParam("subject") String subject,
                              @RequestParam("content") String content) {
        LocalDateTime regDate = LocalDateTime.now();
        BoardItem board = new BoardItem();
        board.setSubject(subject);
        board.setContent(content);
        board.setName(name);
        board.setRegDate(regDate.toString());
        board.setReadCount(0);
        boardMapper.insertWrite(board);
        return "redirect:/board";
    }

    @GetMapping("/article")
    public String showArticle(@RequestParam("id") int id, Model model) {
        BoardItem article = boardMapper.selectById(id);
        model.addAttribute("article", article);
        return "article";
    }

    @PostMapping("/updateArticle")
    public String updateArticle(@RequestParam("id") int id,
                                @RequestParam("subject") String subject,
                                @RequestParam("content") String content) {
        boardMapper.updateArticle(id, subject, content);
        return "redirect:/article?id=" + id;
    }

    @GetMapping("/editArticle")
    public String showEditForm(@RequestParam("id") int id, Model model) {
        BoardItem article = boardMapper.selectById(id);
        model.addAttribute("article", article);
        return "update";
    }

    @PostMapping("/editArticle")
    public String editArticle(@ModelAttribute("article") BoardItem article) {
        boardMapper.updateArticle(article.getId(), article.getSubject(), article.getContent());
        return "redirect:/article?id=" + article.getId();
    }

//    @GetMapping("/deleteArticle")
//    public String showDeleteConfirmationPage(@RequestParam("id") int id, Model model) {
//        BoardItem article = boardMapper.selectById(id);
//        model.addAttribute("article", article);
//        return "redirect:/board";
//    }

    @GetMapping("/deleteArticle")
    public String deleteArticle(@RequestParam("id") int id) {
        boardMapper.deleteArticle(id);
        return "redirect:/board";
    }

}