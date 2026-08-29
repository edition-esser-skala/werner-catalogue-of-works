\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4^\part "Barmherzigkheit" r8 c' c c f c
    a a r a a a a d
    cis cis r \hA cis e e g, a
    f4 r8 a a a a d
    c! c r c c c c h
  }
}

SoliLyrics = \lyricmode {
  Laß ab von dein Be --
  gin -- nen, weill al -- ler Men -- ſchen
  Sin -- nen zum Böſ -- en iſt ge --
  neigt, drum iſt es ja gantz
  bil -- lig, daß man von Her -- tzen
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    f1~
    f
    e2 cis
    d1
    dis
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  <7>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "soli"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
