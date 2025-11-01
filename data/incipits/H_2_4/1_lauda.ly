\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    e'8 d e g e c r4
    g'8 g16 g a8 a16 a a8. g16 g4
    g8 g a a g a h,8. c16
    c4 r r2
    R1*2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    c'8 d c d c g r4
    e'8 e16 e f8 f16 f f8. e16 e4
    c8 c c d e d d4
    c r r2
    R1*2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    e'8^\tutti d e g e c r4
    e8 e16 e f8 f16 f f8. e16 e4
    c8 c c d e d d4
    c g4.^\solo c16 h c8 d
    e d e4 d8 g, c4
    h8 a a4\trill h r
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da, lau -- da, lau -- da,
  lau -- da Ie -- ru -- sa -- lem, Do -- mi -- num,
  lau -- da De -- um tu -- um, Si --
  on. Quo -- ni -- am con -- for --
  ta -- vit se -- ras por -- ta --
  rum tu -- a -- rum,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    g'8^\tutti g g g g g r4
    g8 g16 g a8 a16 a a8. g16 g4
    g8 g a a g a g4
    e r r2
    R1
    g4.^\solo fis8 g d g g16 fis
  }
}

AltoLyrics = \lyricmode {
  Lau -- da, lau -- da, lau -- da,
  lau -- da Ie -- ru -- sa -- lem, Do -- mi -- num,
  lau -- da De -- um tu -- um, Si --
  on.

  be -- ne -- di -- xit fi -- li -- is
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    c8^\tutti h c d c c r4
    c8 c16 c c8 c16 c c8. c16 c4
    c8 c c c c c c[ h]
    c4 r r2
    R1*2 %6
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da, lau -- da, lau -- da,
  lau -- da Ie -- ru -- sa -- lem, Do -- mi -- num,
  lau -- da De -- um tu -- um, Si --
  on.
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    c'8^\tutti g c h c c, r4
    c'8 c16 b a8 g16 f c'8. c,16 c4
    c'8 b a g16[ f] e8 f g4
    c, r r2
    R1*2
  }
}

BassoLyrics = \lyricmode {
  Lau -- da, lau -- da, lau -- da,
  lau -- da Ie -- ru -- sa -- lem, Do -- mi -- num,
  lau -- da De -- um tu -- um, Si --
  on.
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    c'8-\tutti g c h c c, r4
    c'8. b16 a8 g16 f c'4 c,
    c'8. b16 a8 g16 f e8 f g g,
    c4 c8-\solo d e d e h
    c h c c' h4. a8
    g c, d c h4 r8 h
  }
}

BassFigures = \figuremode {
  r1
  r8. <\t>16 <6>4 <4> <3>
  r <6>2.
  r2 r8 <6>4.
  r2. <4 2>8 <6\\>
  r4 <4>8 <4\+> <6>2
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
