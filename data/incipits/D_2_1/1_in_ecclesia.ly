\version "2.24.2"
\include "header.ly"

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "Recitativo" \autoBeamOff
    r8 h4^\solo d8 g8. g16 g8 h
    fis4 fis r8 fis fis g16 a
    c,8. c16 c8 c h4 h
    d8. d16 d8 e f4 f
    e8 h h c d d r16 d e h
    cis8 cis16 e \hA cis8 a16 \hA cis d8 d r4
  }
}

AltoLyrics = \lyricmode {
  In ec -- cle -- si -- a Fran --
  ci -- scus a Chri -- sto per
  An -- ge -- lum ci -- ta -- tus.
  Com -- pa -- rens Fran -- ci -- scus
  ab e -- o -- dem Chri -- sto in -- ter -- ro --
  ga -- tus quid pe -- tat, quid pe -- tat?
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Recitativo"
    g'1~-\solo
    g~
    g2~ g~
    g1
    gis
    g2 fis4. g8
  }
}

BassFigures = \figuremode {
  r1
  <7 4 2>
  <\t \t \t>2 <8 5 3>
  <8> <7!>
  <6> <5>
  <4\+ 2> <6>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
