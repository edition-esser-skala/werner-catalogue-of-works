\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    \pa e'16 f g8 g g \pd g e r4
    g8 g a fis g g r4
    r2 r8 \pa d g f \pd
    e4 r8 g a g \pa f8. g32 a
    g8 g \pd g4\trill g r
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c'8 c d d e c r4
    d8 d d d d d r4
    r2 r8 d c d
    g,4 r8 e' f c d4~
    d8 e d4 e r
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c8 c16 c g8 g c c r4
    g r g8 g r4
    r2 r8 g16 g c8 g
    c4 r r r8 c
    g c g g16 g c4 r
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c'8 c,16. e'32 d8 g,16. f'32 e8 c16. a'32 a16( g) g( fis)
    g8 g,16. h32 d16. d,32 fis16. a32 h8 g16. e'32 e16( d) d( cis)
    d16. d32 fis16. a32 d16( c) c( h) h16. g,32 h16. d32 g16( f) f( e)
    e16. c32 e16. g32 c16( b) b( a) a( g) g( f) f8. g32 a
    g16. d32 e16. c32 d,8 h' c, e'16.\f a32 a16( g) g( fis)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c'8 c,16. e'32 d8 g,16. f'32 e8 c16. a'32 a16( g) g( fis)
    g8 g,16. h32 d16. d,32 fis16. a32 h8 g16. e'32 e16( d) d( cis)
    d16. d32 fis16. a32 d16( c) c( h) h16. g,32 h16. d32 g16( f) f( e)
    e16. c32 e16. g32 c16( b) b( a) a( g) g( f) f8. g32 a
    g16. d32 e16. c32 d,8 h' c, e'16. a32 a16( g) g( fis)
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    c'8^\tutti c d d e e r4
    d8 d d d d d r4
    a8. a16 d8 c h h c d
    g,4 r c8. c16 f4~
    f8 e d4 e r
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son, Ky -- ri --
  e, Ky -- ri -- e __
  e -- lei -- son.
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    g'8^\tutti g g g g g r4
    g8 g a fis g g d g
    fis4 r d8. d16 g8 f
    e e f g a4 a8 a
    g g g4 g r
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son, Ky -- ri --
  e, Ky -- ri -- e e --
  lei -- son, Ky -- ri -- e, Ky -- ri --
  e e -- lei -- son.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    e8^\tutti e d h c c r4
    h8 g d' a h h a h16[ cis]
    d8 fis, g[ a] d,4 r
    g8. g16 c8 b a c d a
    d c4 h8 c4 r
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son, Ky -- ri --
  e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son, Ky -- ri --
  e e -- lei -- son.
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    c8^\tutti c' h g c c, r4
    g8 g' fis d g g, r e'
    d[ c] h a' g[ f] e d'
    c[ b] a g f[ e] d c
    h![ c] g4 c r
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- _ son.
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c8-\tutti e h g c c' h a
    g h fis d g, g' fis e
    d c h a << { g' f e d } \\ { g,4 s } >>
    c8 b a g << { f' e d c } \\ { f,4 s } >>
    h!8 c g' g, c c'-\solo h a
  }
}

BassFigures = \figuremode {
  r4 r4. <6>8 q <6\\>
  r4 r4. <6>8 q <6\\>
  <_+>4 <6>8 <6\\>4. <6>8 q
  r4 q8 <6>2 <6>8
  <6 5>4 <4>8 <3>4 <6>8 q <6\\>
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { \transposedNameShort "clno" "C" "" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = \transposedTimp "C" "" "G" ""
      \Timpani
    }
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
