\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/8 \tempoMarkup "Andante"
    R4.*2
    r8 r f'
    d g g,
    a16 c f a g f
    e d c8 r
    r r g'
    g,16 e f d e8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/8 \tempoMarkup "Andante"
    R4.*2
    r8 r f'
    d g g,
    a16 c f a g f
    e d c8 r
    r r g'
    g,16 e f d e8
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/8 \tempoMarkup "Andante" \autoBeamOff
    c8[^\solo b16 a] g[ f]
    d'8 \grace d c4
    f,8[ g] a
    b g c
    a f r
    r r c'
    a[ h] c
    r r c
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne --
  di -- ctus,
  be -- ne --
  di -- ctus, qui
  ve -- nit,
  qui
  ve -- nit,
  qui
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 3/8 \tempoMarkup "Andante" \autoBeamOff
    R4.*5
    g'8[^\solo f16 e] d[ c]
    a'8 \grace a g4
    c,8[ d] e
  }
}

BassoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus,
  be -- "ne -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 3/8 \tempoMarkup "Andante"
    f,8-\solo g a
    b b' a
    a, g f
    g e' c
    f8. f16 e d
    c8 d e
    f d e
    e d c
  }
}

BassFigures = \figuremode {
  r4.
  r
  r
  <_->
  r
  r
  r8 <6!>4
  r8 <6!>4
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
