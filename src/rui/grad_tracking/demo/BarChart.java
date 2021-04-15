package rui.grad_tracking.demo;
import java.awt.Font;
import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.chart.*;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.NumberTickUnit;
import org.jfree.chart.plot.*;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.entity.*;
import org.jfree.chart.servlet.*;
public class BarChart {
	private DefaultCategoryDataset data = new DefaultCategoryDataset();

	public void setValue(Number value, Comparable<?> rowKey, Comparable<?> columnKey) {

	data.setValue(value, rowKey, columnKey);

	}
	public String generateBarChart(String title, String arg1, String arg2,HttpSession session,PrintWriter pw) {

			String filename = null;

			try {

			//创建chart对象

			
            
			JFreeChart chart = ChartFactory.createBarChart(title, arg1, arg2, data, PlotOrientation.VERTICAL, true, true, false);
			//处理主标题的乱码
			chart.getTitle().setFont(new Font("宋体",Font.BOLD,18));
            //处理子标题乱码
            chart.getLegend().setItemFont(new Font("宋体",Font.BOLD,15));
            //获取图表区域对象
            CategoryPlot categoryPlot = (CategoryPlot)chart.getPlot();
            //获取X轴的对象
            CategoryAxis categoryAxis = (CategoryAxis)categoryPlot.getDomainAxis();
            //获取Y轴的对象
            NumberAxis numberAxis = (NumberAxis)categoryPlot.getRangeAxis();
            //处理X轴上的乱码
            categoryAxis.setTickLabelFont(new Font("宋体",Font.BOLD,15));
            //处理X轴外的乱码
            categoryAxis.setLabelFont(new Font("宋体",Font.BOLD,15));
            categoryAxis.setMaximumCategoryLabelLines(10);
            categoryAxis.setMaximumCategoryLabelWidthRatio(0.5f);
            //处理Y轴上的乱码
            numberAxis.setTickLabelFont(new Font("宋体",Font.BOLD,15));
            //处理Y轴外的乱码
            numberAxis.setLabelFont(new Font("宋体",Font.BOLD,15));
            //处理Y轴上显示的刻度
            numberAxis.setAutoTickUnitSelection(false);
            NumberTickUnit unit = new NumberTickUnit(1);
            numberAxis.setTickUnit(unit);
            //获取绘图区域对象
            BarRenderer barRenderer = (BarRenderer)categoryPlot.getRenderer();
            //设置柱形图的宽度
            barRenderer.setMaximumBarWidth(0.07);
          
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
