\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Andante / Larghetto"
    r2 r8 h' e16( h) a( gis)
    fis4 r r2
    r dis'16( fis) fis( h) gis( e) \hA dis( cis)
    dis( cis) \hA dis8 r4 r2
    r8 e h8.\trill a32 gis fis16( e) fis8 r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Andante / Larghetto"
    r2 r8 gis' h16( gis) fis( e)
    dis4 r r2
    r h'16( dis) dis( fis) h,( cis) h( ais)
    h( ais) h8 r4 r2
    r8 h \sbOn fis16( h) \tuplet 3/2 8 { gis fis e } \sbOff dis( cis) \hA dis8 r4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Andante / Larghetto"
    gis'16[^\solo h] h[ e] cis[ a] gis fis gis[ fis] gis8 r4
    r8 fis h8.[\trill cis32 dis] e2
    e16[ cis] dis[ e] cis8.\trill cis16 h4 r
    fis4. gis8 a![ h] cis h16[ a]
    gis[ fis] gis8 r4 r8 fis \sbOn h16[ cis \tuplet 3/2 8 { dis cis \hA dis] } \sbOff
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne -- di -- ctus, qui ve -- nit
  in no -- _
  mi -- ne Do -- mi -- ni,
  be -- ne -- di -- ctus, qui
  ve -- nit in "no -"
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Andante / Larghetto"
    e16[^\solo gis] gis8 e16[ fis] e dis e[ \hA dis] e8 r4
    r2 r8 e gis8.[\trill ais32 h]
    cis8 h16[ ais] \appoggiatura h8 ais8. ais16 h4 r
    dis,4. e8 fis[ gis] a gis16[ fis]
    e[ dis] e8 r4 r2
  }
}

AltoLyrics = \lyricmode {
  Be -- ne -- di -- ctus, qui ve -- nit
  in no --
  mi -- ne Do -- mi -- ni,
  be -- ne -- di -- ctus, qui
  ve -- nit
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Andante / Larghetto"
    e8-\solo e' a, h e, e' gis, a
    h a gis fis e gis16 fis e dis cis h
    ais8 h fis' fis, h h' e, fis
    h, h' a! gis fis e16 dis cis8 \hA dis
    e gis dis e h h'16 a gis8 fis
  }
}

BassFigures = \figuremode {
  r4 <6 5>8 <_+>4. <6>8 q
  <_+>1
  <6 5>8 r <4> <_+> q4 <6 5>8 <_+>
  <_+>4 <\t>8 \bo r r r <6> q
  r8 r r4 <_+> <6>8 <6\\>
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
