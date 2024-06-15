\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 4/4 \tempoMarkup "Andante"
    R1
    r2 r4 r16 fis' dis h
    g'4 r16 h fis h g8.\trill a32 h c8 dis,
    e g,\p a fis h g d! e
    fis4 r r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 4/4 \tempoMarkup "Andante"
    R1
    r2 r16 fis dis h h'4
    r16 h g h fis'8. dis16 h8 e c h
    h e, fis d! g e h c
    d4 r r2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2
    r8 e'^\tutti h h h e c h
    h g'^\solo d!8. c16 h8 h16 c d[ h] a[ g]
    fis8 d r4 r2
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da -- te no -- men Do -- mi --
  ni. Sit no -- men Do -- mi -- ni be -- ne --
  di -- ctum
}

Alto = {
  \relative c' {
    \clef alto
    \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r8 h^\solo e fis g8. g16 fis4
    e8[ fis16 g] fis8 e dis fis^\tutti h h
    r4 r8 fis g e4 dis8
    e4 r r2
    R1
  }
}

AltoLyrics = \lyricmode {
  Lau -- da -- te pu -- e -- ri
  Do -- _ mi -- num: Lau -- da -- te
  no -- men Do -- mi --
  ni.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r2 r4 r8 dis^\tutti
    e h r h4 c8 fis,8.\trill fis16
    e4 r r2
    a8^\solo h c d h e4 d8
  }
}

TenoreLyrics = \lyricmode {
  Lau -- %2
  da -- te no -- men Do -- mi --
  ni.
  ex hoc nunc et us -- que in
}

Basso = {
  \relative c {
    \clef bass
    \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r2 r4 r8 h^\tutti
    e e r dis[ e] c a h
    e4 r r2
    r4 e8^\solo fis g e fis4
  }
}

BassoLyrics = \lyricmode {
  Lau -- %2
  da -- te no -- men Do -- mi --
  ni.
  ex hoc nunc et "us -"
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 4/4 \tempoMarkup "Andante"
    e8-\solo g16 fis e8 dis e e' a, h
    c h a c h4 r8 h,-\tutti
    e e r dis e c a h
    e4 r r2
    d!4-\solo e8 fis g e fis4
  }
}

BassFigures = \figuremode {
  r2. <6\\>4
  <3>8 <6> <6\\> <3> <_+>4. q8
  r2. <6 5>8 <_+>
  r1
  <5>8 <6> q q4. <7>8 <6>
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
