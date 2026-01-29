
import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

MarkdownStyleSheet customMarkdownStyleSheet(BuildContext context) {
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;
  
  return MarkdownStyleSheet(
    // Escala TODO el texto un 50% más grande (1.5 = 150% del tamaño original)
    textScaler: const TextScaler.linear(1.5),
    
    // Estilo para enlaces (links)
    a: TextStyle(
      color: theme.colorScheme.primary, // Color del tema (azul normalmente)
      decoration: TextDecoration.underline, // Subrayado
      height: 1.5, // Altura de línea (espacio entre líneas)
    ),
    
    // Párrafos normales
    p: theme.textTheme.bodyMedium?.copyWith(
      fontSize: 16, // Tamaño de fuente base
      height: 1.6, // Espaciado entre líneas (más legible)
      letterSpacing: 0.2, // Espacio entre letras
    ),
    pPadding: const EdgeInsets.only(bottom: 20), // Espacio después de cada párrafo
    
    // Código dentro del texto (inline code como `esto`)
    code: theme.textTheme.bodyMedium?.copyWith(
      fontFamily: 'monospace', // Fuente de código (como Courier)
      fontSize: 14, // Más pequeño que el texto normal
      height: 1.4,
      backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200], // Fondo gris
      letterSpacing: 0,
    ),
    
    // Título H1 (el más grande, # en Markdown)
    h1: theme.textTheme.headlineLarge?.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold, // Negrita
      height: 1.3,
      letterSpacing: 0, // Letras ligeramente más juntas
    ),
    h1Padding: const EdgeInsets.only(top: 20, bottom: 12), // Espacio arriba y abajo
    
    // Título H2 (## en Markdown)
    h2: theme.textTheme.headlineMedium?.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      height: 1.3,
      letterSpacing: -0.5,
    ),
    h2Padding: const EdgeInsets.only(top: 70, bottom: 20),
    
    // Título H3 (### en Markdown)
    h3: theme.textTheme.headlineSmall?.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      height: 1.3,
      letterSpacing: -0.3,
    ),
    h3Padding: const EdgeInsets.only(top: 20, bottom: 20),
    
    // Título H4 (#### en Markdown)
    h4: theme.textTheme.titleLarge?.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600, // Semi-negrita
      height: 1.4,
      letterSpacing: -0.2,
    ),
    h4Padding: const EdgeInsets.only(top: 10, bottom: 8),
    
    // Título H5 (##### en Markdown)
    h5: theme.textTheme.titleMedium?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
    h5Padding: const EdgeInsets.only(top: 8, bottom: 8),
    
    // Título H6 (###### en Markdown, el más pequeño)
    h6: theme.textTheme.titleSmall?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
    h6Padding: const EdgeInsets.only(top: 6, bottom: 8),
    
    // Texto en cursiva (*texto* o _texto_ en Markdown)
    em: const TextStyle(
      fontStyle: FontStyle.italic,
    ),
    
    // Texto en negrita (**texto** en Markdown)
    strong: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
    
    // Texto tachado (~~texto~~ en Markdown)
    del: TextStyle(
      decoration: TextDecoration.lineThrough, // Línea sobre el texto
      color: isDark ? Colors.grey[400] : Colors.grey[600], // Color gris
    ),
    
    // Citas/Blockquotes (> texto en Markdown)
    blockquote: theme.textTheme.bodyMedium?.copyWith(
      fontSize: 16,
      height: 1.6,
      fontStyle: FontStyle.italic, // En cursiva
      color: isDark ? Colors.grey[300] : Colors.grey[700], // Color gris
    ),
    blockquotePadding: const EdgeInsets.symmetric(
      horizontal: 16, // Espacio a los lados
      vertical: 12, // Espacio arriba y abajo
    ),
    blockquoteDecoration: BoxDecoration(
      color: isDark ? Colors.grey[800]?.withOpacity(0.3) : Colors.grey[100], // Fondo gris claro
      border: Border(
        left: BorderSide(
          color: theme.colorScheme.primary, // Barra azul a la izquierda
          width: 4, // Grosor de la barra
        ),
      ),
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(4), // Bordes redondeados a la derecha
        bottomRight: Radius.circular(4),
      ),
    ),
    
    // Imágenes
    img: theme.textTheme.bodyMedium,
    
    // Checkboxes (- [ ] o - [x] en Markdown)
    checkbox: theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.primary, // Color del tema
    ),
    
    // Espacio vertical entre bloques de contenido
    blockSpacing: 24.0,
    
    // Indentación de las listas (espacio a la izquierda)
    listIndent: 24.0,
    
    // Estilo de las viñetas/bullets de las listas
    listBullet: theme.textTheme.bodyMedium?.copyWith(
      fontSize: 16,
      height: 1.6,
    ),
    listBulletPadding: const EdgeInsets.only(right: 8), // Espacio entre viñeta y texto
    
    // Encabezados de tabla (th)
    tableHead: theme.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w600, // Semi-negrita
      fontSize: 15,
      height: 1.4,
    ),
    
    // Celdas de tabla (td)
    tableBody: theme.textTheme.bodyMedium?.copyWith(
      fontSize: 15,
      height: 1.5,
    ),
    tableHeadAlign: TextAlign.left, // Alineación del encabezado
    tablePadding: const EdgeInsets.only(bottom: 16), // Espacio después de la tabla
    
    // Bordes de la tabla
    tableBorder: TableBorder.all(
      color: isDark ? Colors.grey[700]! : Colors.grey[300]!, // Color del borde
      width: 1, // Grosor del borde
    ),
    tableColumnWidth: const FlexColumnWidth(), // Columnas flexibles
    tableScrollbarThumbVisibility: true, // Mostrar scrollbar si es necesario
    
    // Padding dentro de las celdas
    tableCellsPadding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),
    tableCellsDecoration: BoxDecoration(
      color: isDark ? Colors.transparent : Colors.white, // Fondo de celdas
    ),
    
    // Padding de los encabezados de tabla
    tableHeadCellsPadding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 10,
    ),
    tableHeadCellsDecoration: BoxDecoration(
      color: isDark ? Colors.grey[800] : Colors.grey[100], // Fondo gris para encabezados
    ),
    tableVerticalAlignment: TableCellVerticalAlignment.middle, // Alineación vertical
    
    // Bloques de código (```código``` en Markdown)
    codeblockPadding: const EdgeInsets.all(16), // Espacio interno
    codeblockDecoration: BoxDecoration(
      color: isDark ? Colors.grey[900] : Colors.grey[100], // Fondo gris oscuro/claro
      borderRadius: BorderRadius.circular(8), // Esquinas redondeadas
      border: Border.all(
        color: isDark ? Colors.grey[700]! : Colors.grey[300]!, // Borde
        width: 1,
      ),
    ),
    
    // Líneas horizontales (--- o *** en Markdown) - DESACTIVADAS
    horizontalRuleDecoration: const BoxDecoration(
      border: Border(
        top: BorderSide(
          width: 0, // Sin grosor = invisible
          color: Colors.transparent, // Transparente
        ),
      ),
    ),
    
    // ALINEACIONES
    textAlign: WrapAlignment.start, // Texto normal: a la izquierda
    h1Align: WrapAlignment.center,  // H1: centrado
    h2Align: WrapAlignment.center,  // H2: centrado
    h3Align: WrapAlignment.start,   // H3: izquierda
    h4Align: WrapAlignment.center,  // H4: centrado
    h5Align: WrapAlignment.center,  // H5: centrado
    h6Align: WrapAlignment.center,  // H6: centrado
    unorderedListAlign: WrapAlignment.start, // Listas sin orden: izquierda
    orderedListAlign: WrapAlignment.start,   // Listas numeradas: izquierda
    blockquoteAlign: WrapAlignment.start,    // Citas: izquierda
    codeblockAlign: WrapAlignment.start,     // Código: izquierda
    
    // Para fuentes que no soportan superíndice nativo (notas al pie)
    superscriptFontFeatureTag: 'sups',
  );
}