\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Vivace"
    r16 d fis d a' fis d' a fis' a, d a fis' d a' fis
    \kneeBeam d' d,, d d d d d d d\p d d d d d d d
    fis'\f c c c c c c c a' a, a a a a a a
    g g, h g e' h g' e h' e, g e h' g e' h
    g' cis,! cis cis cis cis cis cis e g, g g g g g g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Vivace"
    r16 d fis d a' fis d' a fis' a, d a fis' d a' fis
    \kneeBeam d' d,, d d d d d d d\p d d d d d d d
    a'\f a a a a a a a fis fis fis fis fis fis fis fis
    e g, h g e' h g' e h' e, g e h' g e' h
    g' g, g g g g g g cis! e, e e e e e e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    d'4^\tutti r d4. a8
    fis4 d r2
    a'4 r r a
    g8. g16 g4 r2
    g4 r g g
  }
}

SopranoLyrics = \lyricmode {
  Et, et in
  ter -- ra
  pax ho --
  mi -- ni -- bus,
  pax, pax "ho -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    fis4^\tutti r d4. a'8
    fis4 d r2
    fis4 r r fis
    e8. e16 e4 r2
    e4 r e e
  }
}

AltoLyrics = \lyricmode {
  Et, et in
  ter -- ra
  pax ho --
  mi -- ni -- bus,
  pax, pax "ho -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    a4^\tutti r d4. a8
    fis4 d r2
    c'4 r r \hA c
    h8. h16 h4 r2
    cis!4 r cis cis
  }
}

TenoreLyrics = \lyricmode {
  Et, et in
  ter -- ra
  pax ho --
  mi -- ni -- bus,
  pax, pax "ho -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    d4^\tutti r d'4. a8
    fis4 d r2
    dis4 r r \hA dis
    e8. e16 e4 r2
    ais,4 r \hA ais ais
  }
}

BassoLyrics = \lyricmode {
  Et, et in
  ter -- ra
  pax ho --
  mi -- ni -- bus,
  pax, pax "ho -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Vivace"
    d4-\tutti r d'4. a8
    fis4 d r2
    dis4 r \hA dis r
    e r r2
    ais,4 r \hA ais ais
  }
}

BassFigures = \figuremode {
  r1
  r
  <7! 5>2 <\t \t>
  r1
  <7 5>2 <\t \t>
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
