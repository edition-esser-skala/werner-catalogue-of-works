\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    a'4^\solo f8[ e] d4 d' cis8[ d \hA cis d]
    e4 a, r a8[\p h?] cis[ d \hA cis d]
    e4 a, r a\f b8[ c] d4
    c b a8[ b] c2 b4~
    b a d8[ c] b4 a g\trill
    f2 r r
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  _ son, e -- lei --
  _ son, e -- lei -- _
  son, e -- lei -- _ son, __
  e -- lei -- _ _ _
  son,
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*5
    c4^\solo a8[ g] f4 f' e8[ f e f]
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- "lei -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    d4.-\solo e8 f4. g8 a4 a,
    r f' cis d a' a,
    r f' cis d g f
    e g f e d g
    c, f b, d c c,
    << { f'4. } \\ { f,4 } >> g'8 a4. b8 c4 c,
  }
}

BassFigures = \figuremode {
  r2 <6> <_+>
  r4 <6> r2 <_+>
  r4 <6> r2. <6>4
  <6>2. <6>4 <7>2
  q2. <6>4 <6 4> <5 3>
  r2 <6>1
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
