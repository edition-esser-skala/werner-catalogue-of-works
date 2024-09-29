\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    b''8 b, r4 r16 f' a f b f c' f,
    d' d a a b b g g a a, b c d f, g a
    b c d c b a g f' e f e d c b a g
    a c d f g,8 e' f16 f, a b c f, d' f,
    c' f c a f a c f d b d es f b, g' b,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    b''8 b, r4 r16 f' a f b f c' f,
    d' d a a b b g g a a, b c d f, g a
    b c d c b a g f' e f e d c b a g
    a c d f g,8 e' f16 f, a b c f, d' f,
    c' f c a f a c f d b d es f b, g' b,
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    d'8^\tutti d16 d d8 f d c r f
    d c b c a8. a16 b8 c
    d16[ es d c] b[ a g f'] e[ f e d] c[ b] a[ g]
    a8 b g8. g16 a8 c4 d8
    c8. c16 c4 r8 b4 b8
  }
}

SopranoLyrics = \lyricmode {
  Glo -- ri -- a et ho -- no -- re, ho --
  no -- re co -- ro -- na -- vit, co -- ro --
  na -- _ _ _ vit
  e -- um Do -- mi -- nus et con --
  sti -- tu -- it, et "con -"
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    f8^\tutti f16 f f8 a f f r f
    f f d g f4. es8
    d d r d16 d e8 e r g~
    g f f8. e16 f8 a4 f8
    f8. f16 f4 r8 f4 g8
  }
}

AltoLyrics = \lyricmode {
  Glo -- ri -- a et ho -- no -- re, ho --
  no -- re co -- ro -- na --
  vit e -- um, co -- ro -- na -- vit e --
  um Do -- mi -- nus et con --
  sti -- tu -- it, et "con -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    b8^\tutti b16 b b8 c b a r c
    b a b es c8. c16 d8 a
    b16[ c b c] d8 d g, g r c~
    c d c8. c16 c8 c4 b8
    a8. a16 a4 r8 d4 b8
  }
}

TenoreLyrics = \lyricmode {
  Glo -- ri -- a et ho -- no -- re, ho --
  no -- re co -- ro -- na -- vit, co -- ro --
  na -- _ vit e -- um, e --
  um Do -- mi -- nus et con --
  sti -- tu -- it, et "con -"
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    b'8^\tutti b16 b b8 a b f r a
    b f g es f es d[ c]
    b4 r8 b16 b c8 c r e
    f b, c8. c16 f8 a4 b8
    f8. f16 f4 r8 b4 es,8
  }
}

BassoLyrics = \lyricmode {
  Glo -- ri -- a et ho -- no -- re, ho --
  no -- re co -- ro -- na --
  vit e -- um, co -- ro -- na -- vit e --
  _ um Do -- mi -- nus et con --
  sti -- tu -- it, et "con -"
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    b'4.-\tutti a8 b f r a
    b f g es f es d c
    b4 r8 b c4 r8 e
    f b, c4 f,8 f'16 g a8 b
    f4 a8 f b b,16 c d8 es
  }
}

BassFigures = \figuremode {
  r1
  r4. <6 5>8 r2
  r4. <6>8 <_!>2
  <9>8 <5> <4> <_!> r2
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
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  % \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
