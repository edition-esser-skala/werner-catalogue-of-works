\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*3
    r4 a''2~\f
    a8 g16 fis g2~
    g8 fis16 e \hA fis2\trill
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*3
    r8 e'16\f d e8 e, c e
    d d'16 c d8 d, h d
    c c'16 h c8 a a' c,
  }
}

SopranoI = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    r8 g' c4. \tuplet 3/2 8 { h16[ c d] }
    c[ d e d] e4. \tuplet 3/2 8 { d16[ e f] }
    e[ f g f] e8 d c16[ e d f]
    e8 c r4 r
    R2.
    r4 r8 c c[ h16 a]
  }
}

SopranoILyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, lae --
  ta -- re, lae -- ta --
  _ re,

  lae -- "ta -"
}

SopranoII = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.
    r8 g' c4. \tuplet 3/2 8 { h16[ c d] }
    c[ d e d] c8 h \sbOn \tuplet 3/2 8 { c16[ d c } h d] \sbOff
    c4 r r
    R2.*2
  }
}

SopranoIILyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, lae -- ta --
  re,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Vivace"
      \once \override Staff.TimeSignature.style = #'single-digit
    c'4 r8 c, e g
    c4 r8 c, e g
    c4. g8 e g
    c,2 a4
    h2 g4
    a2.
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  <5>4 <6>2
  <7>4 <6>2
  <7>4 <6\\>2
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
        \set Staff.instrumentName = "S 1"
        \new Voice = "SopranoI" { \dynamicUp \SopranoI }
      }
      \new Lyrics \lyricsto SopranoI \SopranoILyrics

      \new Staff {
        \set Staff.instrumentName = "S 2"
        \new Voice = "SopranoII" { \dynamicUp \SopranoII }
      }
      \new Lyrics \lyricsto SopranoII \SopranoIILyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
