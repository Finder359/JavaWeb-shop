package com.shop.servlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet(name="CaptchaServlet" ,value="/admin/CaptchaServlet")
public class CaptchaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. 设置响应类型为图片
        response.setContentType("image/jpeg");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        // 2. 创建图片
        int width = 100;
        int height = 40;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();

        // 3. 设置背景色
        g.setColor(new Color(240, 240, 240));
        g.fillRect(0, 0, width, height);

        // 4. 生成随机验证码（4位数字+字母）
        String chars = "0123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz";
        Random random = new Random();
        StringBuilder captcha = new StringBuilder();

        // 5. 绘制验证码字符
        g.setFont(new Font("Arial", Font.BOLD, 28));
        for (int i = 0; i < 4; i++) {
            char c = chars.charAt(random.nextInt(chars.length()));
            captcha.append(c);

            // 随机颜色
            g.setColor(new Color(random.nextInt(150), random.nextInt(150), random.nextInt(150)));

            // 随机位置
            int x = 15 + i * 22;
            int y = 25 + random.nextInt(10);

            g.drawString(String.valueOf(c), x, y);
        }

        // 6. 绘制干扰线
        g.setColor(Color.LIGHT_GRAY);
        for (int i = 0; i < 5; i++) {
            int x1 = random.nextInt(width);
            int y1 = random.nextInt(height);
            int x2 = random.nextInt(width);
            int y2 = random.nextInt(height);
            g.drawLine(x1, y1, x2, y2);
        }

        // 7. 添加噪点
        for (int i = 0; i < 50; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            g.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));
            g.fillRect(x, y, 1, 1);
        }

        // 8. 将验证码存入Session
        HttpSession session = request.getSession();
        session.setAttribute("captcha", captcha.toString().toLowerCase());

        // 9. 输出图片
        g.dispose();
        ImageIO.write(image, "JPEG", response.getOutputStream());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}