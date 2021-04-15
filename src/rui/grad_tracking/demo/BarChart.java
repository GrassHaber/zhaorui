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

			//����chart����

			
            
			JFreeChart chart = ChartFactory.createBarChart(title, arg1, arg2, data, PlotOrientation.VERTICAL, true, true, false);
			//���������������
			chart.getTitle().setFont(new Font("����",Font.BOLD,18));
            //�����ӱ�������
            chart.getLegend().setItemFont(new Font("����",Font.BOLD,15));
            //��ȡͼ���������
            CategoryPlot categoryPlot = (CategoryPlot)chart.getPlot();
            //��ȡX��Ķ���
            CategoryAxis categoryAxis = (CategoryAxis)categoryPlot.getDomainAxis();
            //��ȡY��Ķ���
            NumberAxis numberAxis = (NumberAxis)categoryPlot.getRangeAxis();
            //����X���ϵ�����
            categoryAxis.setTickLabelFont(new Font("����",Font.BOLD,15));
            //����X���������
            categoryAxis.setLabelFont(new Font("����",Font.BOLD,15));
            categoryAxis.setMaximumCategoryLabelLines(10);
            categoryAxis.setMaximumCategoryLabelWidthRatio(0.5f);
            //����Y���ϵ�����
            numberAxis.setTickLabelFont(new Font("����",Font.BOLD,15));
            //����Y���������
            numberAxis.setLabelFont(new Font("����",Font.BOLD,15));
            //����Y������ʾ�Ŀ̶�
            numberAxis.setAutoTickUnitSelection(false);
            NumberTickUnit unit = new NumberTickUnit(1);
            numberAxis.setTickUnit(unit);
            //��ȡ��ͼ�������
            BarRenderer barRenderer = (BarRenderer)categoryPlot.getRenderer();
            //��������ͼ�Ŀ��
            barRenderer.setMaximumBarWidth(0.07);
          
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
