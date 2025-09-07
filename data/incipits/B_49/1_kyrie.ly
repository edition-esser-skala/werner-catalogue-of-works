\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Allegro"
    a'8. a16 a8 b a d, r b'\p
    a d, r a'\f g e'4 f,8
    f e r a\p g e'4 f,8
    f e r a\f f'16 e d4 c!8
    b16 a g8 r g e'16 d c4 b8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Allegro"
    a'8. a16 a8 b a d, r b'\p
    a d, r a'\f g e'4 f,8
    f e r a\p g e'4 f,8
    f e r a\f f'16 e d4 c!8
    b16 a g8 r g e'16 d c4 b8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    a'8. a16 a8 b a d, r b'\p
    a d, r a'\f g e'4 f,8
    f e r a\p g e'4 f,8
    f e r a\f f'16[ e] d4 c!8
    b16[ a] g8 r g e'16[ d] c4 b8
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    f8. f16 f8 g f f r g\p
    f f r f\f e4 e8 d
    d cis r f\p e4 e8 d
    d cis r4 r8 f16[\f g] a[ d, e f]
    g4 r r8 e16[ f] g[ c, d e]
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei --
  son, e -- "lei -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    d8.^\tutti d16 d8 d d d r d\p
    d d r d\f h a4 a8
    a a r d\p h a4 a8
    a a r4 r8 a\f a a
    r b16[ c] d8 b r g g g
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son,
  e -- lei -- son, e -- lei -- son,
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    d8.^\tutti d16 d8 g d d r g\p
    d d r d\f e cis4 d8
    a' a, r d\p e cis4 d8
    a' a, r4 r8 d16[ e] f4
    r8 g16[ a] b4 r8 c,!16[ d] e4
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei --
  _ son, e -- "lei -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Allegro"
    d4.-\tutti g8 d d r g\p
    d d r d\f e cis4 d8
    a' a, r d\p e cis4 d8
    a' a, r4 r8 d16\f e f4
    r8 g16 a b4 r8 c,!16 d e4
  }
}

BassFigures = \figuremode {
  r1
  r2 <5!>
  <6 4>8 <5 _+>4. <5!>2
  <6 4>8 <5 _+> r2 <6>4
  r q2 q4
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
}
