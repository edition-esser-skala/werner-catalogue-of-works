\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante"
    c'4.\p \tuplet 3/2 8 { e16 d c } g'4. \tuplet 3/2 8 { h16 a g }
    c8 h16 a g8 f e16 f g f g8 g,
    a16 h c h c8 g f16 g a g a8 e
    d16 e f e f8 e e d16. g'32 h8 h,
    r4 r8 fis' g4 a\trill
    h c\trill d8 c16 h a8 g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante"
    c'4.\p \tuplet 3/2 8 { e16 d c } g'4. \tuplet 3/2 8 { h16 a g }
    c8 h16 a g8 f e16 f g f g8 g,
    a16 h c h c8 g f16 g a g a8 e
    d16 e f e f8 e e d16. d'32 g8 g,
    r2 r16 g h g d'4~
    d8 h'16 a g8 fis16 e d8 g e d16 e
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    c4.^\solo \tuplet 3/2 8 { e16[ d c] } g'4. \tuplet 3/2 8 { h16[ a g] }
    c8[ h16 a] g8 f e16[ d] c8 r g'
    a16[ h c h] c8 g f16[ g a g] a8 e
    d16[ e f e] f8 e e d r d
    e4 fis\trill g a
    h c d8[ c16 h] a8 g
  }
}

AltoLyrics = \lyricmode {
  Sal -- _ _ _
  _ ve Re -- gi -- na, Re --
  gi -- _ na sal -- _ ve,
  sal -- _ ve ma -- ter mi --
  se -- ri -- cor -- _
  _ _ _ di -- ae,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Andante"
    c'8 e d c h a g f
    e4 h c8 d e c
    f4 r8 e d4 r8 c
    h4 r8 c g4 r
    c8 c' a d h a16 g fis8 e16 d
    g8 fis e d16 c h4 c
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r2 <6 4>8 <5 3>4.
  r4 <6\\>8 <_+> r2
  r2. <6>8 <5>
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
