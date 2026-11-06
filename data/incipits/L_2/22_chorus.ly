\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Allegretto"
    g'8 h d g h d
    a fis4 d g8
    e c h g' a, fis'
    g d \tuplet 3/2 8 { \sbOn h16 a h g fis g d c d h a h \sbOff }
    g8 h4 d8 g h
    d fis4 a8 h g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Allegretto"
    g'8 h d g h d
    a fis4 d g8
    e c h g' a, fis'
    g d \tuplet 3/2 8 { \sbOn h16 a h g fis g d c d h a h \sbOff }
    g8 h4 d8 g h
    d fis4 a8 h g
  }
}

TenoreI = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Allegretto"
    d4 d d
    d2 d4
    e2 d4
    d2 r4
    d d d
    d2 d4
  }
}

TenoreILyrics = \lyricmode {
  Mir habn än
  Rich -- ter
  oä -- nen
  Mann
  der nach der
  Grech -- "ti -"
}

TenoreII = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Allegretto"
    g4 g g
    a( fis) h
    a( g) fis
    g2 r4
    g g g
    a( fis) g
  }
}

TenoreIILyrics = \lyricmode {
  Mir habn än
  Rich -- ter
  oä -- nen
  Mann
  der nach der
  Grech -- "ti -"
}

TenoreIII = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Allegretto"
    h4 h h
    a2 d4
    c( h) a
    h2 r4
    h h h
    a( d) h
  }
}

TenoreIIILyrics = \lyricmode {
  Mir habn än
  Rich -- ter
  oä -- nen
  Mann
  der nach der
  Grech -- "ti -"
}

BassoIeII = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Allegretto"
    g'4 g g
    fis( d) h
    c2 d4
    g,2 r4
    g' g g
    fis( d) g
  }
}

BassoIeIILyrics = \lyricmode {
  Mir habn än
  Rich -- ter
  oä -- nen
  Mann
  der nach der
  Grech -- "ti -"
}

Continuo = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \tempoMarkup "Allegretto"
    g'4 g g
    fis d h
    c2 d4
    g,2 r4
    g' g g
    fis d g
  }
}

BassFigures = \figuremode {
  r2.
  r
  <6>4 <5>2
  r2.
  r
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
        \set Staff.instrumentName = "Schullmeiſter"
        \new Voice = "TenoreI" { \dynamicUp \TenoreI }
      }
      \new Lyrics \lyricsto TenoreI \TenoreILyrics

      \new Staff {
        \set Staff.instrumentName = "Schwabnwürth"
        \new Voice = "TenoreII" { \dynamicUp \TenoreII }
      }
      \new Lyrics \lyricsto TenoreII \TenoreIILyrics

      \new Staff {
        \set Staff.instrumentName = "Schnepfendrekh"
        \new Voice = "TenoreIII" { \dynamicUp \TenoreIII }
      }
      \new Lyrics \lyricsto TenoreIII \TenoreIIILyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "Mazko" "Barthlme" }
        \new Voice = "BassoIeII" { \dynamicUp \BassoIeII }
      }
      \new Lyrics \lyricsto BassoIeII \BassoIeIILyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { indent = 2\cm }
}
