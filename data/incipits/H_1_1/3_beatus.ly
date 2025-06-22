\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    R1*5
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    R1*5
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r8 a'^\solo \appoggiatura a16 g8 f16[ e] f4 r
    r2 r8 c' \appoggiatura c16 b8 a16[ g]
    a4 r r2
    R1
  }
}

SopranoLyrics = \lyricmode {
  Be -- a -- tus vir,
  be -- a -- tus
  vir
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r8 f^\solo e d16[ cis] d4 r
    r2 r8 a' g f16[ e]
    f4 r r2
    R1
  }
}

AltoLyrics = \lyricmode {
  Be -- a -- tus vir,
  be -- a -- tus
  vir
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    a2^\solo a16[ g a8]~ a16[ h cis a]
    d8 d, r4 r8 f c'4~
    c16[ b c8]~ c16[ d e c] f8 f, r4
    r8 c' c d16[ e] f[ e] d[ c] h[ a] g[ f]
    e4 g8 c a16[ g] a8 b c
  }
}

TenoreLyrics = \lyricmode {
  Be -- a --
  _ tus, be -- a --
  _ tus
  qui ti -- met, ti -- met Do -- mi --
  num: In man -- da -- tis e -- ius
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r8 f^\solo g a d,4 r
    r2 r8 a' b c
    f,4 r r2
    R1
  }
}

BassoLyrics = \lyricmode {
  Be -- a -- tus vir,
  be -- a -- tus
  vir
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    d8-\solo f e d cis h a g
    f f' g a d,16 d' c! b! a8 g16 f
    e8 d c b a a' b c
    f, a e c d f g h,
    c d e c f, f'16 es d8 a
  }
}

BassFigures = \figuremode {
  r1
  <6>4 <8 6>8 <_+>4. <6>4
  r2 <6>4 <8 6>8 <5 3>
  r2. <_!>4
  r2. <6>4
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
