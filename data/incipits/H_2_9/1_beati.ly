\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "[no tempo]"
    R2.
    r4 a'\f fis'
    g, e' g,
    fis2 r4
    r a\f fis'
    gis, e' d,\trill
    cis2 r4
    R2.
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "[no tempo]"
    R2.
    r4 a'\f fis'
    g, e' g,
    fis2 r4
    r a\f fis'
    gis, e' d,\trill
    cis2 r4
    R2.
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R2.*8
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
    a'4^\solo d, e
    fis8[ e] d4 r
    R2.
    a'4 d, e
    fis8[ e] d4 r
    R2.
    r4 e fis
    d2 e4
  }
}

AltoLyrics = \lyricmode {
  Be -- a -- ti
  o -- mnes,

  be -- a -- ti
  o -- mnes

  qui -- a
  ti -- ment,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R2.*8
  }
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R2.*8
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "[no tempo]"
    d8-\solo e fis4 cis
    d fis d
    e cis a
    d8 e fis4 cis
    d fis d
    e8 fis gis2
    a4 a, d
    h' gis e
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  r
  <_+>4 <6> <5>
  r2.
  r4 <5>2
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

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
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
