\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    \sbOn \tuplet 3/2 8 { c16\f\trill h c } c16. e32 \tuplet 3/2 8 { e16\trill d e } e16. g32 \tuplet 3/2 8 { g16\trill f g } g16. c32 \tuplet 3/2 8 { c16\trill h c } c16. e32 \gotoBar "9"
    \sbOn c16( g) \tuplet 3/2 8 { a g f } \sbOff \appoggiatura e8 d8.\trill c16 c16(\p c') g( f) e4
    r2 \tuplet 3/2 8 { \sbOn c'16\p h c e d e } g8 r
    \tuplet 3/2 8 { e16 d e g f g } c8 e, \tuplet 3/2 8 { d16 c d g f g } h8 d, \sbOff
    c r r4 r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r4 \sbOn \tuplet 3/2 8 { c16\f\trill h c } c16. e32 \tuplet 3/2 8 { e16\trill d e } e16. g32 \tuplet 3/2 8 { g16\trill f g } g16. c32 \gotoBar "9"
    g8 \tuplet 3/2 8 { f16 e d } \appoggiatura c8 h8.\trill c16 c\p e8 d16 c4
    r2 \sbOn \tuplet 3/2 8 { g'16\p f g c h c } e8 r
    \tuplet 3/2 8 { c16 h c e d e } g8 g, g4 r8 d
    \tuplet 3/2 8 { e16 d e a g a } c8 e, d4 r \sbOff
  }
}

Soli = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1 \gotoBar "9"
    r2 r4 r8 g'
    c c, \tuplet 3/2 8 { e16[\trill d e] g[\trill f g] } c8 r \tuplet 3/2 8 { g16[\trill f g] c[\trill h c] }
    e8 c~ \tuplet 3/2 8 { c16[ d e] e[ d c] } g'8 g, r g
    c16[\trill h] c8 c e \sbOn d32([ c d e fis16 g)] \sbOff \tuplet 3/2 8 { a16[ g \hA fis] e[ d c] }
  }
}

SoliLyrics = \lyricmode {
  Der
  Ad -- ler ſchwüngt ſich zwar, ſchwüngt ſich
  zwar zu __ der Son -- ne und
  kom -- met ihr zur Zeit __ _ auch
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8\f r c r c r c r \gotoBar "9"
    e f g g, c4 r
    c8 c c c c c c c
    c c' c c h h h h
    a a a g fis fis fis fis
  }
}

BassFigures = \figuremode {
  r1
  r4 <6 4>8 <5 3> r2
  r1
  r1
  r4. <6>8 r2
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
        \set Staff.instrumentName = "Jahel"
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
