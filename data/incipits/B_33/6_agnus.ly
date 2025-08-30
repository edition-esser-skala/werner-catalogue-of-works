\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Largo"
    R1
    r2 r8 e' e e
    e4 r r8 e e e
    d4 r r2
    r r8 a' d g,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Largo"
    R1
    r2 r8 cis' cis cis
    cis4 r r8 cis cis cis
    fis,4 r r2
    r a4. h16 cis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    cis8[^\solo e] a[ cis] gis[ h] d fis
    e[ h] gis e cis4 cis
    r8 cis' e cis ais4 ais
    h8 d d fis eis4 fis~
    fis8[ eis16 dis?] \hA eis4\trill fis r
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta,
  pec -- ca -- ta mun -- di:
  Mi -- se -- re -- re no -- _
  _ bis.
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*5
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*5
  }
}

Basso = {
  \relative c' {
    \clef bass
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*5
  }
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Largo"
    a'2-\solo h4. a8
    gis4 e a, a'
    g r fis fis,
    h2 cis8 cis' a fis
    cis'4 cis, fis4. e!8
  }
}

BassFigures = \figuremode {
  r2 <6>4. <8 6>8
  <6>1
  <4 2>2 <7 _+>
  <5>4 <6> <_+> <6>
  <4> <_+> <5> <6>8 <6>
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

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }

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
