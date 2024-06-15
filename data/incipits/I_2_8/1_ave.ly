\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "Tempo ordinario" \autoBeamOff
    r8 e^\solo a gis c4. h8
    r a4 g8 f4\trill e
    r8 d'4 c8 f8. f16 e4
    r8 d4 c h8 a4\trill
    h r r2
    R1
  }
}

SopranoLyrics = \lyricmode {
  A -- ve Re -- gi -- na
  coe -- _ lo -- rum,
  a -- ve Do -- mi -- na
  An -- _ ge -- lo --
  rum:
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "Tempo ordinario" \autoBeamOff
    r2 r8 e^\solo a gis
    c4. h8 r d,4 c8
    a'4 g r8 a4 g8
    f8. f16 e4 d8 d d4
    d r r2
    R1
  }
}

AltoLyrics = \lyricmode {
  A -- ve Re --
  gi -- na coe -- _
  lo -- rum, a -- ve
  Do -- mi -- na An -- ge -- lo --
  rum:
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \tempoMarkup "Tempo ordinario" \autoBeamOff
    R1*3
    r2 r8 g4^\solo fis8
    g16[ a] h[ c] d[ e] \tuplet 3/2 8 { fis[ e d] } g8 g, r4
    r8 g4 d'8 e8. e16 d8 c
  }
}

TenoreLyrics = \lyricmode {
  Sal -- ve
  ra -- dix, sal -- ve por -- ta
  ex qua mun -- do lux est
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Tempo ordinario" \autoBeamOff
    R1*4
    r2 r8 c4^\solo h8
    c16[ d] e[ f] g[ a] \tuplet 3/2 8 { h[ a g] } c8 c, r4
  }
}

BassoLyrics = \lyricmode {
  Sal -- ve
  ra -- dix, sal -- ve por -- ta
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Tempo ordinario"
    a4-\solo c8 e a,4 r8 e'
    a4 e a,8 h c e
    f4 e d c
    << { a8^\markup \remark "vlne" h c a' fis g d d, } \\ { a'_\org h c a fis g d' d, } >>
    g g' fis d h e d g
    << { \once \override TextScript.X-offset = #-3 e^\markup \remark "vlne" c' h g } \\ { e_\org c h <g g'> } >> c c' f, a
  }
}

BassFigures = \figuremode {
  r4. <_+>2 q8
  r4 <6 4>8 <5 _!> <6> <\t> <9> <6>
  <5> <6> <7> <6> r4 <6>8 <5>
  <6> <\t> <9> <3> <6 5>4 <4>8 <_+>
  r2 <6>8 q <7>4
  r2. <6>8 <3>
}

\score {
  <<
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
