\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "[no tempo]"
    d8 e fis g a a, fis' d
    g4 r8 e d4 r8 fis'
    e fis d'16 d, d d' d fis, e d e8 cis'
    d d, r4 r8 d16 cis h8 a
    gis4 h cis16 a cis e a a, a a'
    a d, d a' h d, d h' cis,8 cis, r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "[no tempo]"
    d8 e fis g a a, fis' d
    g4 r8 e d4 r8 a''
    a a d16 d, d d' d fis, e d e8 cis'
    d d, r4 r8 h16 a gis8 fis
    e4 gis a8 cis16 e a a, a a'
    a d, d a' h d, d h' cis,8 a, r4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    a'4.^\solo d8 cis4 d
    h8 g16[ a] h8 cis d8. a16 a8 fis'^\tutti
    e fis d d d d d[ cis]
    d4 a8^\solo h16[ cis] d2~
    d8 cis16[ d] e8 d cis16[ h] a8 r4
    r2 r8 a h cis
  }
}

SopranoLyrics = \lyricmode {
  Con -- fi -- te -- bor
  ti -- bi, ti -- bi, Do -- mi -- ne, in
  to -- to, to -- to cor -- de me --
  o, in con -- si --
  li -- o iu -- sto -- rum,
  et con -- "gre -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    r2 r4 r8 a'^\tutti
    a a h h a h a4
    a r r2
    r r4 e8 e
    a a h h e, e r4
  }
}

AltoLyrics = \lyricmode {
  in
  to -- to, to -- to cor -- de me --
  o,
  in con --
  si -- li -- o iu -- sto -- rum,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    r2 r4 r8 d^\tutti
    e d d d16[ e] fis8 e e4
    d r r2
    r r4 a8 h16[ cis]
    d8 e16[ fis] e8 d cis16[ h] a8 r4
  }
}

TenoreLyrics = \lyricmode {
  in
  to -- to, to -- to cor -- de me --
  o,
  in con --
  si -- li -- o iu -- sto -- rum,
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    r2 r4 r8 d'^\tutti
    cis d h a16[ g] fis8 g a[ a,]
    d4 r r2
    r r4 a'8 a
    fis fis gis gis a a r4
  }
}

BassoLyrics = \lyricmode {
  in
  to -- to, to -- to cor -- de me --
  o,
  in con --
  si -- li -- o iu -- sto -- rum,
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "[no tempo]"
    d4 r r2
    r r4 r8 d'
    cis d h a16 g fis8 g a a,
    d4 r r2
    r r4 a'
    fis gis a8 a, r4
  }
}

BassFigures = \figuremode {
  r1
  r
  <6>2 q4 <4>8 <3>
  r1
  r
  <6>4 <6 5>2.
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
