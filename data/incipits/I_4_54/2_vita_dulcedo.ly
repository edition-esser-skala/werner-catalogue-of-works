\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    R1*3
  }
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    r8 f^\solo b b b a16([ g)] f([ es)] d([ c)]
    d8 b f' b b16([ a)] a8 f es'
    es16([ c)] d8 r f, g([ a16 b] c[ d)] es([ c)]
  }
}

BassoLyrics = \lyricmode {
  Vi -- ta, dul -- ce -- do et spes
  no -- stra, et spes no -- stra, et spes
  no -- stra, spes no -- stra,
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Andante"
    b8-\solo c d es f g a f
    << { b } \\ { b, c d b } >> f' g a f
    b, c d b es d c es
  }
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
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
  >>
}
