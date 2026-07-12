\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  r8^\part "Barmherzigkeit" h' g e r c' a f
  dis[ c'] h[ a] g fis r h
  gis h e,16[ \hA gis] h[ d] c[ h] c8 r h
}

text = \lyricmode {
  A Di -- o, a Di -- o
  mein Ge -- lieb -- ter, wan
  ich dein groſ -- ſen Schmer -- tzen in
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
