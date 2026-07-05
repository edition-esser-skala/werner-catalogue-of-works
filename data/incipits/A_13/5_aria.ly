\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key c \major \time 2/4 \tempoMarkup "Tempo giusto"
    r8 c'4\p c,8
    c c'4 c,8
    c c'4 e8
    \sbOn \tuplet 3/2 8 { d16 c h } a g f8.\trill e16
    e8 g'4 e8
    d16( fis,) g8 \tuplet 3/2 8 { e'16 d c h a g
    fis g a } d,8 r d'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key c \major \time 2/4 \tempoMarkup "Tempo giusto"
    r8 e16\p f g8 a
    g e16 f g8 a
    g c4 e8
    \sbOn \tuplet 3/2 8 { d16 c h } a g f8.\trill e16
    e8 e'16 d c8 e
    d16( fis,) g8 \tuplet 3/2 8 { e'16 d c h a g
    fis g a } d,8 a' h
  }
}

Soli = {
  \relative c' {
    \clef soprano
    \twofourtime \key c \major \time 2/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    g'4. a16[ f]
    g8 c g \tuplet 3/2 8 { a16[ g f] }
    g8 c, c' e
    \tuplet 3/2 8 { d16[ c h] } a[ g] f8.\trill e16
    e4 g8 \tuplet 3/2 8 { c16[ d e] }
    d8 c16[ h] \tuplet 3/2 8 { e[ d c] h[ a g] }
    fis8 d'4 h16[ g]
  }
}

SoliLyrics = \lyricmode {
  Ob es
  ſchei -- net daß man
  mei -- net es ſey
  al -- le Hilff ver --
  lohrn, hat doch
  Gott ein Weib er --
  khorn, die da
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key c \major \time 2/4 \tempoMarkup "Tempo giusto"
    c'8 c,16 d e8 f
    e c16 d e8 f
    e e16 d e8 c
    h e a, h
    c c16 d e8 c
    h g' c, e
    d d16 e fis8 g
  }
}

BassFigures = \figuremode {
  r2
  r
  r
  r4 <6>
  r2
  r
  <_+>
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
        \set Staff.instrumentName = "Barmh."
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
