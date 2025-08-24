\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Andante"
    r2 a'8\p d fis, g
    a h e, cis' d4 r8 fis,
    e a16 h cis d e8 r g, a, g'
    fis4 r r2
    cis32( e16.) d32( fis16.) e32( g16.) fis32( a16.) e8 a,4 d8
    cis4 r r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Andante"
    r2 a'8\p d fis, g
    a h e, cis' d4 r8 d,
    cis4 a h8 e16 d cis h a8
    d4 r r2
    e8 a,4 d8 cis d e fis
    e4 r r2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    a'8^\solo d fis, g a8. d,16 d4
    r8 d' cis16[\trill h] a[\trill g] fis8 d16[ e fis g] a[ h]
    a8[ e'] cis[ a] g4.\trill g8
    fis a4 d8 cis d e fis16[ d]
    e8 a, r4 r8 d, \tuplet 3/2 8 { e16[ fis g] fis[ g a] }
    e8.\trill e16 e4 r2
  }
}

SopranoLyrics = \lyricmode {
  Sub tu -- um prae -- si -- di -- um
  con -- fu -- gi -- mus, San -- cta
  De -- i Ge -- ni --
  trix. No -- stras de -- pre -- ca -- ti --
  o -- nes ne, ne de --
  spi -- ci -- as
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*5
    a8^\solo cis e fis g4 g8 g
  }
}

AltoLyrics = \lyricmode {
  in ne -- ces -- si -- ta -- ti -- bus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*5
    r2 cis8^\solo cis cis cis
  }
}

TenoreLyrics = \lyricmode {
  in ne -- ces -- "si -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*5
    r2 ais'8^\solo ais ais ais
  }
}

BassoLyrics = \lyricmode {
  in ne -- ces -- "si -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Andante"
    d4.-\solo e8 fis4 h8 a16 g
    fis8 g a a, d4 r
    R1
    d'8 d,16 e fis8. g16 a8 fis cis d
    a fis' cis d a' fis cis d
    a4 r ais'8 ais ais ais
  }
}

BassFigures = \figuremode {
  r1
  r4 <_+>2.
  r1
  r2 r8 <6>4.
  r8 <6>2 q4.
  r2 <7 5>
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
