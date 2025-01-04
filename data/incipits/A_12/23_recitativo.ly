\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part Eliphas a d a b r16 \hA b d8. \hA b16
    g8 h d16 d d e! c8 c r16 c e c
    a8 a d16 d f d h!8 d c \tuplet 3/2 8 { f16[ e d] }
    c8.[ d16] d4\trill c8 \fC g^\part Job c16 c e c
    a8. a16 a8 cis e e e f
  }
}

SoliLyrics = \lyricmode {
  Ô Job, mein Freund! ſo helf -- fe
  doch, da -- mit wir Gnad er -- lan -- gen. Dan wie es
  ſcheint, ſo ſeynd wir all mit Sa -- thans Strickh ge --
  fan -- _ gen. Ge -- hab dich wohl, ver --
  za -- ge nicht, es iſt noch Huld zu
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    fis2 d
    h! e!
    f~ f4 e8 f
    g4 g, e'2
    cis1
  }
}

BassFigures = \figuremode {
  <6>2 <6- _!>
  <6> q
  <5>4 <6> <4! 2> <6>
  <4> <3> <6>2
  q1
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
