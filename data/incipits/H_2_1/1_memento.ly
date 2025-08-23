\version "2.24.2"
\include "header.ly"

\layout {
  \context {
    \Staff
    \RemoveAllEmptyStaves
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/4 \tempoMarkup "Largo" \autoBeamOff
    R2.*6
    r4 d'^\solo d
    cis d e
    f4. e8 d4
    r b c
  }
}

SopranoLyrics = \lyricmode {
  si -- cut
  iu -- ra -- vit
  Do -- mi -- no,
  vo -- tum
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/4 \tempoMarkup "Largo" \autoBeamOff
    R2.*8
    r4 a'^\solo f
    d g2
  }
}

AltoLyrics = \lyricmode {
  vo -- tum
  vo -- vit,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/4 \tempoMarkup "Largo" \autoBeamOff
    a4^\solo d8[ e] f4
    e4. f8 d4
    d8[ cis] cis4 d
    b2 b4
    r a g
    f4. g8 a4
    d g,2
    a r4
    r r b~
    b g e
  }
}

TenoreLyrics = \lyricmode {
  Me -- men -- to,
  Do -- mi -- ne,
  Da -- vid et
  o -- mnis
  man -- sue --
  tu -- di -- nis
  e -- _
  ius,
  vo --
  tum "vo -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \tempoMarkup "Largo" \autoBeamOff
    R2.*10
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \tempoMarkup "Largo"
    d8-\solo e f4 d
    g a b
    a4. g8 fis4
    g8 f e4 d
    cis2.
    d2 c4
    b2.
    << { a'8[ g] } \\ { a,4 } >> f' e
    d2 \clef tenor b'4~^\aTre
    b g e
  }
}

BassFigures = \figuremode {
  r2.
  <6>
  <_+>
  r4 <5->2
  <6> <5>4
  r2 <6>4
  <7> <6>2
  <_+>2.
  r2 <5>4
  r2 <6 5>4
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
