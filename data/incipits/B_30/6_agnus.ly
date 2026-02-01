\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Andante passato"
      \once \override Staff.TimeSignature.style = #'single-digit
    e'8. g32 f e8 d e16 g c e,
    d8 r r h c16 e a c,
    h4 r8 cis d4~
    d8 c4 b a8~
    a g fis2\trill
    e8 e'4\p e e8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Andante passato"
      \once \override Staff.TimeSignature.style = #'single-digit
    c'8.\trill e32 d c8 d4 c8
    h[ dis] e h4 a8
    gis4 r8 \hA gis a4
    g f e
    dis8 e4 \hA dis16 cis \hA dis4\trill
    e8 g4\p g g8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante passato"
      \once \override Staff.TimeSignature.style = #'single-digit
    e'8.[^\tutti g32 f] e8 d e4
    d8 dis e4 e
    r8 h c[ cis] d4~
    d8 c4 b a8~
    a g fis2\trill
    e4 h'\p cis
  }
}

SopranoLyrics = \lyricmode {
  A -- _ gnus De --
  i, qui tol -- lis
  pec -- ca -- _
  _ _ _
  ta mun --
  di: Mi -- "se -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante passato"
      \once \override Staff.TimeSignature.style = #'single-digit
    g'4.^\tutti g8 g4
    g8 r r h h[ a]
    gis4 r8 \hA gis a4
    g f e
    dis8 e4 \hA dis16[ cis?] \hA dis4
    g4 g\p g
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De --
  i, qui tol --
  lis pec -- ca --
  ta, pec -- ca --
  ta mun -- _ _
  di: Mi -- "se -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante passato"
      \once \override Staff.TimeSignature.style = #'single-digit
    c4.^\tutti d8 d[ c]
    h r r e c4
    h r8 e a,[ d]
    e4 r r8 a,
    h h h2
    h4 e\p e
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De --
  i, qui tol --
  lis pec -- ca --
  ta, pec --
  ca -- ta mun --
  di: Mi -- "se -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante passato"
      \once \override Staff.TimeSignature.style = #'single-digit
    c'4.^\tutti h8 c4
    g8 r r gis a4
    e r8 e f4
    e d c
    h8 e h2
    e4 e\p e
  }
}

BassoLyrics = \lyricmode {
  A -- gnus De --
  i, qui tol --
  lis pec -- ca --
  _ ta, pec --
  ca -- ta mun --
  di: Mi -- "se -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Andante passato"
      \once \override Staff.TimeSignature.style = #'single-digit
    c8-\tutti c'4 h8 c4
    g8 r r gis a a,
    e'4 r8 e f4
    e d c
    h8 e h2
    e,8 e'\p e e e e
  }
}

BassFigures = \figuremode {
  r4. r8 <9> <8>
  r4. r8 <9> <8>
  <_+>4. <6\\>8 <6>4
  <7>8 <6> <7> <6-> <7> <6>
  <7 _+>4 \bo <4> <_+>
  r2 <6\\>4
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
