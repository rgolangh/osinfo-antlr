import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.misc.OrderedHashSet;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


public class OsinfoPropertiesLoader extends OsinfoBaseListener {

    Map<String, String> props = new HashMap<String, String>();

    @Override
    public void exitOs_record(OsinfoParser.Os_recordContext ctx) {
        props.put(ctx.UNIQUE_OS_NAME().getText(), ctx.getText());
    }

    public static void main(String... args) throws IOException {
        ParseTreeWalker walker = new ParseTreeWalker();
        OsinfoPropertiesLoader loader = new OsinfoPropertiesLoader();
        OsinfoLexer osinfoLexer = new OsinfoLexer(new ANTLRInputStream("/tmp/osinfo.properties"));
        OsinfoParser osinfoParser = new OsinfoParser(new CommonTokenStream(osinfoLexer));

        walker.walk(loader, osinfoParser.parse());

        for (Map.Entry<String, String> entry : loader.props.entrySet()) {
            System.out.println(entry);
        }
    }
}
