\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Largo"
    r2 r8 cis'4 fis8
    d4 dis e eis
    fis16( cis) cis( e) d( h) ais( gis) \sbOn ais8 \tuplet 3/2 8 { cis16 h cis d cis d e d e } \sbOff
    fis8 a! d a h h, dis fis
    g h, cis e a, e'4 d8
    cis e4\p a, gis16 a h8 gis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Largo"
    r8 a'4 d8 cis ais4 ais8
    h4. fis8 h h, h'16 ais h8
    ais16 ais8 cis16 h( d,) cis( h) \sbOn cis8 \tuplet 3/2 8 { ais'16 gis? ais h ais h cis h cis } \sbOff
    d8 fis4 fis8 d4 r8 dis
    e g r cis, d! a fis'8. fis16
    e8 cis,\p cis cis h h h h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    r8 a'4^\tutti d8 cis cis4 fis8
    d4 dis8 dis e e eis4
    fis r r2
    d4. d8 d4 dis
    e! cis d8 e e[ d]
    cis a4^\solo e'8 d[ h] gis d'
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di:
  Mi -- se -- re -- re,
  mi -- se -- re -- re no --
  bis. A -- gnus De -- i, qui
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    fis4^\tutti fis ais fis8 fis
    fis4 fis8 fis h h, h'16[ ais h8]
    ais4 r r2
    fis4. fis8 g4 fis
    g e a!8. g16 fis4
    e r r2
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di:
  Mi -- se -- re -- re,
  mi -- se -- re -- re no --
  bis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    d8[^\tutti a] a[ fis] fis ais4 cis8
    h4 h8 fis' e e h4
    cis r r2
    a!4. a8 h4 h
    h8 e4 cis8 a a a4
    a r r2
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di:
  Mi -- se -- re -- re,
  mi -- _ se -- re -- re no --
  bis.
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    d4^\tutti d fis ais,8 ais
    h[ fis'] h a! g g g4
    fis r r2
    d4. d'8 g,4 h
    e, a fis8 cis d4
    a r r2
  }
}

BassoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di:
  Mi -- se -- re -- re,
  mi -- se -- re -- re no --
  bis.
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Largo"
    d2-\tutti fis4 ais,
    h8 fis' h a! g2
    fis4 r fis r
    d8 d d d' g, g h h
    e, e a a fis cis d4
    a r r2
  }
}

BassFigures = \figuremode {
  r2 <_+>4 <6>
  r8 <\t> <_+> <\t> <6>2
  <_+> q
  r2. <_+>4
  r2 <6>8 <6> <9> <8>
  r1
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
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
