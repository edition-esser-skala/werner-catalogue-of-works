\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Presto moderato"
    R1*3 \gotoBar "13"
    a4 r r2
    R1
    r4 e''\p f2
    e4 a4. g8 d e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Presto moderato"
    a'2 c
    h4 e4. d8 a h
    c g c4. h8 fis gis \gotoBar "13"
    a,4 r r2
    r4 g'!\p a2
    g4. g8 a16 h c8 d d
    g, c, r e' d4. c16 h
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "Presto moderato"
    r4 c8. d16 e8. f16 g8 a
    d, g, r4 a8. h16 c8 d
    g,4 r f8. g16 a8 h \gotoBar "13"
    R1*4
  }
}

Soli = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto moderato"
    R1*3 \gotoBar "13"
    a'2 c
    h4 e4. d8 a h
    c g c2 h4
    c r r2
  }
}

SoliLyrics = \lyricmode {
  Wer Gott
  will, Gott _ will was
  an -- ge -- lo -- _
  ben,
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Presto moderato"
    a4 a'4. g8 e f
    g2 f~
    f8 e d c d2 \gotoBar "13"
    a4\p a'4. g!8 e f
    g2 f
    e d
    c8 c' c16 h c8 h2
  }
}

BassFigures = \figuremode {
  r2. <6>4
  <5> <6> <7> <6>
  <5 2>2 <7>4 <6>
  r <6>4
  <5> <6> <7> <6>
  q2 <7>4 <6>
  r q <7> <6>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new Staff {
        \set Staff.instrumentName = "vla"
        \Viola
      }
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "Jobs" "Frau" }
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
