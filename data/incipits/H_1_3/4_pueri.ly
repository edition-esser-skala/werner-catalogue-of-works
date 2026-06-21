\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Allegro mà moderato"
    R1*5
    r2 r4 r8 f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Allegro mà moderato"
    R1*5
    r2 r4 r8 f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro mà moderato"
    f4^\solo a c c
    a c8 c d4. d8
    c4 r c2
    c4 c d b
    c4. c8 a4 r
    r2 r4 r8 f^\tutti
  }
}

SopranoLyrics = \lyricmode {
  Lau -- _ da -- te
  pu -- e -- ri Do -- mi --
  num: Lau --
  da -- te no -- men
  Do -- mi -- ni.
  Sit
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro mà moderato"
    r2 c4^\solo e
    f f d f8 f
    a4. a8 g4 r
    f2 d4. e16[ f]
    g8 f16[ e] f8 g c,4 r
    r r8 c^\tutti f4. a8
  }
}

AltoLyrics = \lyricmode {
  Lau -- _
  da -- te pu -- e -- ri
  Do -- mi -- num:
  Lau -- da -- te
  no -- men Do -- mi -- ni.
  Sit no -- men,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro mà moderato"
    R1*4
    r2 r4 r8 f,^\tutti
    c'4 e16[ f g8] c,8. c16 c4
  }
}

TenoreLyrics = \lyricmode {
  Sit
  no -- men Do -- mi -- ni
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro mà moderato"
    R1*4
    r4 r8 c^\tutti f4 a16[ g f8]
    e[ d] c[ b] a4 r8 f'
  }
}

BassoLyrics = \lyricmode {
  Sit no -- men
  Do -- mi -- ni, sit
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Allegro mà moderato"
    f8-\solo a g f e d c b16 a
    d8 c16 b a8 f b b' d, b
    f f' a g16 f e8 d c b
    a g f g16 a b8 b'16 a g8 f
    e d16 c d8 e f-\tutti g a g16 f
    e8 d c b a a' g f
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r
  r2 <6>
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
