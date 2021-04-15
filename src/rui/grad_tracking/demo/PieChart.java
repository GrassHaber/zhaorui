package rui.grad_tracking.demo;
import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.jfree.data.general.*;

import org.jfree.chart.*;

import org.jfree.chart.plot.*;

import org.jfree.chart.entity.*;

import org.jfree.chart.servlet.*;

import org.jfree.chart.labels.StandardPieToolTipGenerator;

public class PieChart {

private DefaultPieDataset data = new DefaultPieDataset();

public void setValue(String key, double value) {

data.setValue(key, value);

}

public String generatePieChart(String title, HttpSession session,

PrintWriter pw) {

String filename = null;

try {

//创建chart对象

PiePlot plot = new PiePlot(data);



plot.setToolTipGenerator(new StandardPieToolTipGenerator());

JFreeChart chart = new JFreeChart("", JFreeChart.DEFAULT_TITLE_FONT,

plot, true);

chart.setBackgroundPaint(java.awt.Color.white); //设置图片的背景色

chart.setTitle(title);

//把生成的图片放到临时目录

ChartRenderingInfo info = new ChartRenderingInfo(new

StandardEntityCollection());

//500是图片长度，300是图片高度

filename = ServletUtilities.saveChartAsPNG(chart, 500, 300, info,

session);

ChartUtilities.writeImageMap(pw, filename, info, false);

pw.flush();

} catch (Exception e) {

System.out.println("Exception - " + e.toString());

e.printStackTrace(System.out);

filename = "public_error_500x300.png";

}

return filename;

}

}
