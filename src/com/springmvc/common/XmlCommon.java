package com.springmvc.common;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/9/24.
 */
public class XmlCommon {

    private Document xmlDocument = null;

    public XmlCommon() {
    }

    //加载xml
    public XmlCommon(String xmlPath) {
        File file = new File(xmlPath);
        DocumentBuilder documentBuilder = null;
        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        try {
            documentBuilder = documentBuilderFactory.newDocumentBuilder();
            xmlDocument = documentBuilder.parse(file);
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //获取根结点下的所有节点
    public List<Map<String, Node>> parseXml() {
        //获取根节点的元素对象
        Element element = xmlDocument.getDocumentElement();
        List<Map<String, Node>> list = listNodes(element);

        return list;
    }

    //获取某个节点下的所有子节点
    private List<Map<String, Node>> listNodes(Node element) {
        List<Map<String, Node>> list = new ArrayList<>();
        Map<String, Node> map = null;
        //获取元素节点的所有子节点
        NodeList nodeList = element.getChildNodes();
        //遍历
        for (int i = 0; i < nodeList.getLength(); i++) {
            map = new HashMap<>();
            //得到某个具体的节点对象
            Node node = nodeList.item(i);
            map.put(node.getNodeName(), node);
            list.add(map);
            listNodes(node);
        }
        return list;
    }

    //获取节点的内容值
    public String getContent(Node node) {
        String result = "";
        result = node.getTextContent();
        return result;
    }

    //根据节点和属性名获取属性
    public String getAttributesValue(Node node, String name) {
        String result = "";
        result = attributes(node).get(name);
        return result;
    }

    private Map<String, String> attributes(Node node) {
        Map<String, String> map = new HashMap<>();
        for (int i = 0; i < node.getAttributes().getLength(); i++) {
            map.put(node.getAttributes().item(i).getNodeName(), node.getAttributes().item(i).getNodeValue());
        }
        return map;
    }
}
