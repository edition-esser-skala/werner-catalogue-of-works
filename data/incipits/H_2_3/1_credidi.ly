\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*3
    r2 r4 r8 d'16 e
    fis g a4 fis8 g16 a h8 e,16 d cis8
    d e fis g16 a g8 h, cis16 d e8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*3
    r2 r4 r8 h'16 cis
    d e fis8 fis,16 g a8 h g' a a,~
    a g a16 g fis8 d e e16 fis g8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1*6
  }
}

SopranoLyrics = \lyricmode {
  %tacet
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1*6
  }
}

AltoLyrics = \lyricmode {
  %tacet
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    d8^\solo c16 h a8 d h a g8. g16
    fis4 d'8 d e[ d] e d
    cis4. c8 h4 e8 a,
    a2 g4 r
    R1*2 %6
  }
}

TenoreLyrics = \lyricmode {
  Cre -- di -- di, pro -- pter quid lo -- cu -- tus
  sum, e -- go au -- tem hu --
  mi -- li -- a -- tus sum
  ni -- mis.
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1*3
    r4 d8^\solo a' h[ a] g4
    a8[ fis] fis[ d] g[ e] e4
    fis8[ g] a4 h8[ g] e[ cis]
  }
}

BassoLyrics = \lyricmode {
  E -- go di -- xi
  in ex -- ces -- su
  me -- o: O -- mnis
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    g'4.-\solo fis8 g fis e a
    d, c h h' c h c h
    a a, a' e16 fis g8 g, c cis
    d4 d, g h'16 a g8
    fis4 d16 e fis8 e4 cis16 h a8
    d4. e16 fis g4 a8 g
  }
}

BassFigures = \figuremode {
  r4 <4 2>2 <7>8 q
  r1
  <_+>4. <6!>2 <6 5>8
  <4>4 <3>2 <6>4
  r2 <5>
  r2. <_+>8 <4\+>
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
