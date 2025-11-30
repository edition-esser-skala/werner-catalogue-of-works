\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    c'4 d c r8 b
    a f' e d c b a4~
    a h c r
    g a g r8 f
    e c' b a g f e4
    f8 f' e d c b a g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    c'4 d c r8 b
    a f' e d c b a4~
    a h c r
    g a g r8 f
    e c' b a g f e4
    f8 f' e d c b a g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    c'4^\tutti d c r8 b
    a[ f' e d] c[ b] a4~
    a h c r
    g a g r8 f
    e[ c' b a] g[ f] e4
    f8 f' e[ d] c[ b a g]
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- _ _
  _ son,
  Ky -- ri -- e e --
  lei -- _ _
  son, e -- lei \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r2 f4^\tutti d8[ e]
    f4 r8 f f2~
    f4 e8[ d] e a g[ f]
    e4 r e f
    g r8 f g2
    a4 r8 f f2
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei --
  _ son, e -- lei --
  son, Ky -- ri --
  e e -- lei --
  son, e -- "lei -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r2 a4^\tutti b
    c r8 b c2
    d g,8 r r4
    r2 c4 a
    c r8 c c2
    c4 r8 b c2
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei --
  _ son,
  Ky -- ri --
  e e -- lei --
  son, e -- "lei -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r2 f4^\tutti g
    f r8 b a[ g f e]
    d2 c8 f e[ d]
    c4 r c d
    c r8 f e[ d c b]
    a4 r8 b' a[ g f e]
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei --
  _ son, e -- lei --
  son, Ky -- ri --
  e e -- lei --
  son, e -- "lei -"
}

Organo = {
  \relative c {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    c''4-!-\tutti d-! \clef bass f,, g
    f r8 b a g f e
    d2 c8 f e d
    c4 r c d
    c r8 f e d c b
    a4 r8 b' a g f e
  }
}

BassFigures = \figuremode {
  r2. <5>8 <6>
  r1
  <5>4 <6!>4. <3>8 q q
  r2. <5>4
  r1
  r
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
        \set Staff.instrumentName = "b"
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
