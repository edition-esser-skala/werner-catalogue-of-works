\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Largo"
    r8 d'\p r d r a' r fis
    r g r d r e r d
    r h' r d, r a' r d,
    r g r a, r fis' r d,
    r2 r8 d' r d,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Largo"
    r8 h'\p r h r d r d
    r h r h r g r fis
    r d'r h r d r fis
    r h, r e r a, r a
    r2 r8 fis r a
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    g4~ g16[ h a g] d'8 a h fis
    g16[ fis] g8 g'4. fis16[ e] d[ a] h[ c]
    h[ a] g8 r h a h16 cis d8 fis,
    g16[ fis] g8 e'16[ cis] a[ g] g[ fis] fis8 r a
    h16[ g'] \tuplet 3/2 8 { fis[ e d] } \grace d8 cis4\trill d r8 a
  }
}

TenoreLyrics = \lyricmode {
  Al -- _ ma Re -- dem --
  pto -- ris, Re -- dem -- pto -- ris
  Ma -- ter, quae per -- vi -- a coe -- li,
  coe -- li por -- ta ma -- nes et
  stel -- la ma -- ris, et
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Largo"
    g4-\solo g' fis d
    e h c d
    g, g' fis d
    e cis d fis
    g a h fis
  }
}

BassFigures = \figuremode {
  r2 r4 <6>
  r1
  r
  r
  r4 <4>8 <_+> r2
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
