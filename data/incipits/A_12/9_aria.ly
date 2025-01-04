\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Vivace"
    r2 a'4 a'
    gis16 a h \hA gis e8 g fis16 g a fis d4 \gotoBar "7"
    r2 a,4\p a'
    gis16 a h \hA gis e8 g fis16 g a fis d( cis) d8
    r8 fis'~ fis[ d'] r e,~ e[ cis']
    r d,~ d[ h'] r cis, cis[ a']
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Vivace"
    d4 d' cis16 d e cis a8 cis
    d16( cis) d8 e16( d) e8 a, fis a fis \gotoBar "7"
    r2 a,4\p a'
    gis16 a h \hA gis e8 g fis16 g a fis d( cis) d8
    r4 r8 d' e( gis,) r cis
    d( fis,) r h cis e,4 cis8
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1*2 \gotoBar "7"
    d,4 d' cis16[ d e cis] a4
    h16[ a h8] cis16[ h cis8] d[ a] fis[ d]
    fis[ a] d[ fis] e[ gis,] a16[ h cis8]
    d[ h] gis[ d'] cis16[ h a gis] a4
  }
}

SoliLyrics = \lyricmode {
  Mein Ver -- ſu -- chung
  iſt ver -- ge -- ben,
  alß ſo lang der
  Menſch im Le -- ben
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Vivace"
    d8 d' fis, d a' a, cis a
    h4 cis d8 a fis d \gotoBar "7"
    d'8\p d' fis, d a' a, cis a
    h4 cis d8 a fis d
    d''4 h cis r8 a
    h4 e, a8 e cis a
  }
}

BassFigures = \figuremode {
  r1
  <6\\>4 <6>8 <5> r2
  r1
  <6\\>4 <6>8 <5> r2
  r1
  <7>4 <7 _+>2.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
        \set Staff.instrumentName = "Leviathan"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
