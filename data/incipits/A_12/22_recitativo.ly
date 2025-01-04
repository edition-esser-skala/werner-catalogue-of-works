\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    R1*4
    e'4 r g r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    R1*4
    g'4 r d' r
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    h8^\part Job dis fis a, g8. g16 g8 h
    d d16 e f8 e c c r c16 e
    a,8 g b a f4 f'8 d
    c!8. c16 c8 h gis gis r4
    \clef bass r4^\part Schöpffer c r8 g g16 g h g
  }
}

SoliLyrics = \lyricmode {
  Al -- les hat ſein Zihl und End, doch
  will ſich bey mir nichts zeü -- gen, weill der
  Schmertz ſchon all -- be -- hend im -- mer
  grö -- ßer ſucht zu ſtei -- gen.
  Wie, was muß ich dan von
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    dis2 e
    h e
    cis d
    dis e
    c4 r h r
  }
}

BassFigures = \figuremode {
  r1
  r2 <6>
  <6 5>1
  <7 5>2 <_+>
  r1
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
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
