import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

public class OsinfoPropertiesLoader extends OsinfoBaseListener {

    Map<String, String> props = new HashMap<String, String>();

    @Override
    public void exitOsRecord(OsinfoParser.OsRecordContext ctx) {
        props.put(ctx.UNIQUE_OS_ID().getText(), ctx.getText());
    }

    public static void main(String... args) throws IOException {
        ParseTreeWalker walker = new ParseTreeWalker();
        OsinfoPropertiesLoader loader = new OsinfoPropertiesLoader();
        OsinfoLexer osinfoLexer = new OsinfoLexer(new ANTLRFileStream("/tmp/osinfo.properties"));
        OsinfoParser osinfoParser = new OsinfoParser(new BufferedTokenStream(osinfoLexer));

        walker.walk(loader, osinfoParser.parse());

        for (Map.Entry<String, String> entry : loader.props.entrySet()) {
            System.out.println(entry);
        }
    }
}
