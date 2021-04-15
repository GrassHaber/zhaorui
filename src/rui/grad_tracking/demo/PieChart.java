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

//����chart����

PiePlot plot = new PiePlot(data);



plot.setToolTipGenerator(new StandardPieToolTipGenerator());

JFreeChart chart = new JFreeChart("", JFreeChart.DEFAULT_TITLE_FONT,

plot, true);

chart.setBackgroundPaint(java.awt.Color.white); //����ͼƬ�ı���ɫ

chart.setTitle(title);

//�����ɵ�ͼƬ�ŵ���ʱĿ¼

ChartRenderingInfo info = new ChartRenderingInfo(new

StandardEntityCollection());

//500��ͼƬ���ȣ�300��ͼƬ�߶�

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
