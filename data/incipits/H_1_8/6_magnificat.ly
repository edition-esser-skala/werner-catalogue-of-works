\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    R1*2
    r2 r4 e'8 e16 e
    a8 g e e f! f d d16 d
    e8 g16 g g8 g g g c, a'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    R1*2
    r2 r8 e'16\f e cis cis cis cis
    d8 d16 d d8. cis16 d8 d h h
    c d e4 d8 g f f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r8 \mvTr a' e' d16 d c8 d16 e f8 e
    d8. d16 c4 r g'8 fis16[ e]
    dis dis e cis dis4\trill e8 e16^\tutti e cis cis cis cis
    d8 d16 d d8. cis16 d8 d h! h
    c d e4 d8 g f f
  }
}

SopranoLyrics = \lyricmode {
  Ma -- gni -- fi -- cat a -- ni -- ma me -- a
  Do -- mi -- num. O -- mnes
  ge -- ne -- ra -- ti -- o -- nes. Qui -- a fe -- cit mi -- hi
  ma -- gna, qui po -- tens est, et san -- ctum
  no -- men e -- ius, et san -- ctum
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1
    r4 e8^\solo e16[ f] g8 g16 a h8 a16[ g]
    fis8 g16 a fis4 e r
    a8^\tutti g16 g e e e e f8 f16 f d8 d16 d
    e8 g16 g g8 g16 g g8 g a a
  }
}

AltoLyrics = \lyricmode {
  Ec -- ce __ e -- nim ex hoc be -- %2
  a -- tam me di -- cent.
  Fe -- cit po -- ten -- ti -- am in bra -- chi -- o su -- o, dis --
  per -- sit su -- per -- bos, su -- per -- bos men -- te
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 r4 r8 c~^\solo
    c h16 h c8 c16 c e8 e d c16 c
    h8 h h4 h8 e^\tutti e8. e16
    a,8 b a4 a8 a g4
    g8 g g[ c] h h c16[ h] c[ d]
  }
}

TenoreLyrics = \lyricmode {
  Qui --
  a re -- spe -- xit hu -- mi -- li -- ta -- tem an --
  cil -- lae su -- ae. De -- po -- su --
  it po -- ten -- tes, po -- ten --
  tes de se -- de et ex -- "al -"
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r4 r8 gis'^\solo a a d, e16[ f]
    g8 g16 g c,8 c16 c c'8 c g a
    h e, h4 e a16^\tutti a a a
    f!8 g16 g a4 d,8 d16 d g8 g16 f
    e8 h c8. c16 g8 e' a16[ g a h]
  }
}

BassoLyrics = \lyricmode {
  Et ex -- ul -- ta -- vit
  spi -- ri -- tus me -- us in De -- o sa -- lu --
  ta -- ri me -- o. Et mi -- se -- ri --
  cor -- di -- a e -- ius a pro -- ge -- ni -- e
  in pro -- ge -- ni -- es ti -- "men -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    a'4-\solo gis a d,8 e16 f
    g8 g, c4 c' g8 a
    h e, h4 e a-\tutti
    f!8 g a a, d4 g,8 g'16 f
    e8 h c4 g8 e' a a16 h
  }
}

BassFigures = \figuremode {
  r1
  <4>8 <3>2. <6\\>16 <5>
  <_+>4 <4>8 <_+> r4 <_+>
  <6>8 r <4> <_+> r2
  <6!>8 r2 <5>8 <6>4
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
