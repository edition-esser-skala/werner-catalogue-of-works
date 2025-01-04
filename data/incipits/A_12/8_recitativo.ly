\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part Leviathan b es16 \hA b c des c8 c r g16 a
    b8 b d! c a a r a16 h
    cis8. cis16 d8 e! f, f r f16 g
    a8 a c b g g r d'16 b
    as8. as16 as8 g es es r c'16 g
  }
}

SoliLyrics = \lyricmode {
  Weil mir dan Gwald ge -- ge -- ben, mei -- ne
  Hand an Job zu ſtreck -- hen, werd ich
  ihn an al -- len Eck -- hen mör -- der --
  lich zu quel -- len trach -- ten, daß er
  ſolt vor Äng -- ſten be -- ben, mit -- hin
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    g'2 e!~
    e f
    e! d
    c! b
    h c
  }
}

BassFigures = \figuremode {
  <6->2 <6>
  <5->1
  <6\\>
  <4\+ _->2 <6>
  <7- 5> <_->
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
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
