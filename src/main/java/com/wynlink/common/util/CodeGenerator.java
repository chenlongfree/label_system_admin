package com.wynlink.common.util;

import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.wynlink.common.mybatis.BaseModel;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Properties;

public class CodeGenerator {

    public static void main(String[] args) throws IOException {
        // 代码生成器
        AutoGenerator mpg = new AutoGenerator();

        // 全局配置
        GlobalConfig gc = new GlobalConfig();
        gc.setOutputDir("d:/code");
        gc.setAuthor("ChenLong");
        gc.setOpen(false);
        gc.setActiveRecord(true);
        mpg.setGlobalConfig(gc);

        Properties pps = new Properties();
        pps.load(new FileInputStream(CodeGenerator.class.getClassLoader().getResource("application-dev.properties").getPath()));
        Enumeration enum1 = pps.propertyNames();//得到配置文件的名字
        while(enum1.hasMoreElements()) {
            String strKey = (String) enum1.nextElement();
            String strValue = pps.getProperty(strKey);
            System.out.println(strKey + "=" + strValue);
        }

        // 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl(pps.getProperty("spring.datasource.url"));
        // dsc.setSchemaName("public");
        dsc.setDriverName(pps.getProperty("spring.datasource.driver-class-name"));
        dsc.setUsername(pps.getProperty("spring.datasource.username"));
        dsc.setPassword(pps.getProperty("spring.datasource.password"));
        mpg.setDataSource(dsc);

        // 配置模板
        TemplateConfig templateConfig = new TemplateConfig();

        // 配置自定义输出模板
        //指定自定义模板路径，注意不要带上.ftl/.vm, 会根据使用的模板引擎自动识别
        templateConfig.setEntity("templates/entity.java");
        mpg.setTemplate(templateConfig);

        // 包配置
        PackageConfig pc = new PackageConfig();
        pc.setParent("com.wynlink.lsa");
        pc.setModuleName("sys"); // 模块名
        pc.setEntity("model");
        mpg.setPackageInfo(pc);

        // 策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
        strategy.setEntityLombokModel(true);
        strategy.setSuperEntityClass(BaseModel.class);
        strategy.setRestControllerStyle(true);
        strategy.setInclude(new String[]{"t_sys_user"});
//        strategy.setControllerMappingHyphenStyle(true);
        strategy.setTablePrefix("t_");
        mpg.setStrategy(strategy);
        mpg.execute();
    }
}
