\version "2.24.2"
\include "header.ly"

SopranoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    \mvTr g'8.[\trill^\solo a16] \sbOn \tuplet 3/2 8 { h[\trill a h c\trill h c] } \sbOff d8 h16[ c] d8.[\trill e32 fis]
    g8 g, r4 r2
    r8 d'4 \tuplet 3/2 8 { e16[ fis g] } d4~ \tuplet 3/2 8 { d16[ e d] c[ h a] }
    h[\trill a] h8 r4 r2
    r8 g d' e16 fis g2
  }
}

SopranoILyrics = \lyricmode {
  Al -- _ _ ma Ma --
  _ ter,
  Re -- dem -- pto -- ris
  Ma -- ter,
  quae per -- vi -- a "coe -"
}

SopranoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    \mvTr g'8.[\trill^\solo a16] \sbOn \tuplet 3/2 8 { h[\trill a h c\trill h c] } \sbOff d8 h16[ c] d8.[\trill e32 fis]
    g8 g, r4 r2
    r8 d'4 \tuplet 3/2 8 { e16[ fis g] } d4~ \tuplet 3/2 8 { d16[ e d] c[ h a] }
    h[\trill a] h8 r4 r8 e, g a16 h
  }
}

SopranoIILyrics = \lyricmode {
  Al -- _ _ ma Ma --
  _ ter,
  Re -- dem -- pto -- ris
  Ma -- ter, quae per -- vi -- a
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Andante"
    g4-\solo r g r
    g r g r
    g8 g' h, c h g' fis d
    g, g' h, c h g' fis d
    g4 fis e8. d16 cis8 h
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r2. <5>4
}

\score {
  <<
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
