\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    R1*4
    r2 r32 a' h? cis d e f g a16 e cis a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    R1*4
    r2 r32 a' h? cis d e f g a16 e cis a
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2
    a'8^\solo c b d g,[ a] b4
    a8 d4 c8 b4 a
    a8[ g16 f] g4 a r8 cis^\tutti
  }
}

SopranoLyrics = \lyricmode {
  bo -- nae vo -- lun -- ta -- _
  tis, bo -- nae vo -- lun --
  ta -- _ tis. "Lau -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r4 d4.^\solo e8 f g
    a f b a16[ g] f4 r
    f8 a g f e16[ d e8] f[ g]~
    g f r g4 f8 f e
    d16[ e f8] e[ d] cis4 r8 e^\tutti
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni -- bus
  bo -- nae vo -- lun -- ta -- _
  tis, bo -- nae vo -- lun --
  ta -- _ tis. "Lau -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r4 r8 a4^\solo d8 c! b
    a f r4 r2
    R1
    r2 r4 r8 a^\tutti
  }
}

TenoreLyrics = \lyricmode {
  bo -- nae vo -- lun -- %2
  ta -- tis,

  "Lau -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    d4.^\solo e8 f g a b
    cis, d4 \hA cis8 d4 r
    R1*2
    r2 r4 r8 a^\tutti
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra pax ho --
  mi -- _ ni -- bus

  "Lau -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    d4.-\solo e8 f g a b
    cis,8 d4 \hA cis8 d4 e
    f b, c d8 e
    f4 e d c
    b2 a4 r8 a-\tutti
  }
}

BassFigures = \figuremode {
  r4. <\t>8 <6> q q q
  q <3> <6 2> <6>4. <6>8 <5>
  r4 <6>8 <5> q <6> <6-> <\t 3>
  <5 9> <6 8> <7 3> <6> <6- 4> <\t 3> <6 4> <\t 3>
  <7>4 <6> <_+>4. q8
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
        \set Staff.instrumentName = "b"
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
