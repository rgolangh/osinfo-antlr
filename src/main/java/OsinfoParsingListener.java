import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.misc.NotNull;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

public class OsinfoParsingListener extends OsinfoBaseListener {

    @Override public void enterOsRecord(@NotNull OsinfoParser.OsRecordContext ctx) {
        System.out.println(ctx.OS_UNIQUE_NAME());
    }

    public static void main(String... args) throws IOException {
        ParseTreeWalker walker = new ParseTreeWalker();
        OsinfoParsingListener loader = new OsinfoParsingListener();
        OsinfoLexer osinfoLexer = new OsinfoLexer(new ANTLRFileStream("/tmp/osinfo.properties"));
        OsinfoParser osinfoParser = new OsinfoParser(new BufferedTokenStream(osinfoLexer));

        walker.walk(loader, osinfoParser.parse());
    }
}
